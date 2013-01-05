module Fetchers
  class FetchService
    class << self
      def fetch_all!
        # Only github for now
        Repository.github.each do |repository|
          fetch_data = Fetchers::GithubCommits.new(
            repository,
            GITHUB_ACCOUNT[:username],
            GITHUB_ACCOUNT[:password]
          )

          repository.commits = fetch_data.map do |commit_data|
            Commit.new(commit_data)
          end
        end
      end
    end
  end
end
