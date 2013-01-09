module Pages
  module WelcomeHelper
    def link_to_github(repository)
      github_proto = "https://"
      url = "github.com/#{repository.owner}/#{repository.name}"
      link_to(url, github_proto + url)
    end
  end
end
