require 'net/http'

module Fetchers
  class GithubCommits
    include Enumerable
    include HTTParty
    base_uri "https://api.github.com"
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
        api_get_commits.map { |c| c["sha"] }
      end

      def api_get_commits
        self.class.get(author_commits_url, {
          :basic_auth => @auth
        })
      end

      def api_get_commit(sha)
        self.class.get(commit_url(sha), {
          :basic_auth => @auth
        })
      end

      def author_commits_url
        commits_url + "?author=#{@repository.author}"
      end

      def commit_url(commit_sha)
        commits_url + "/#{commit_sha}"
      end

      def commits_url
        "/repos/#{@repository.owner}/#{@repository.name}/commits"
      end
  end
end
