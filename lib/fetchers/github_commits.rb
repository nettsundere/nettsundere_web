require 'net/http'

module Fetchers
  class GithubCommits
    include Enumerable
    include HTTParty
    API_ROOT = "https://api.github.com"
    
    HEADERS = {
      "User-Agent" => "vladimir-kiselev.ru commit fetcher"
    }
    
    COMMITS_PER_PAGE = 100
    
    base_uri API_ROOT
    format :json

    def initialize(repository, username, password)
      @repository = repository
      @auth = {
        :username => username,
        :password => password
      }
    end

    def each
      find_commits_ids.each do |sha|
        yield find_commit(sha)
      end
    end

    private
      def find_commit(sha)
        commit = api_get_commit(sha)

        {
          :message => commit["commit"]["message"],
          :time => commit["commit"]["committer"]["date"],
          :additions => commit["stats"]["additions"],
          :deletions => commit["stats"]["deletions"],
          :scmid => sha
        }
      end

      def find_commits_ids
        scmids = api_get_commits.map do |commits| 
          commits.map { |c| c["sha"] }
        end
        scmids.flatten
      end

      def api_get_commits
        commits = []
        url = author_commits_url
        loop do
          url_with_per_page = "#{url}&per_page=#{COMMITS_PER_PAGE}"
          page_commits = self.class.get(
            url_with_per_page,
            { 
              :basic_auth => @auth,
              :headers => HEADERS
            }
          )

          commits << page_commits

          link = parse_link(page_commits.headers["link"])
          if link && (link != url)
            url = link
          else
            return commits
          end
        end
      end

      def parse_link(link_header)
        if link_header =~ author_commits_regexp
          author_commits_url + $1
        else
          nil
        end
      end

      def api_get_commit(sha)
        self.class.get(commit_url(sha),
          { 
            :basic_auth => @auth,
            :headers => HEADERS
          }
        )
      end

      def author_commits_url
        commits_url + "?author=#{@repository.author}"
      end

      def author_commits_regexp
        Regexp.new(
          "^<#{API_ROOT}#{author_commits_url.gsub('?', '\?')}(.+)>; rel=\"next\","
        )
      end

      def commit_url(commit_sha)
        commits_url + "/#{commit_sha}"
      end

      def commits_url
        "/repos/#{@repository.owner}/#{@repository.name}/commits"
      end
  end
end
