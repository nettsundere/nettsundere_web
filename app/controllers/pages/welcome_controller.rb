module Pages
  class WelcomeController < PageController
    def show
      @repositories = Repository.published.localized.includes(:commits)
    end
  end
end
