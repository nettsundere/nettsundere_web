module Api
  class RepositoriesController < ApiController
    def show
      repository = available_repositories.find(params[:id])
      respond_with JSON.generate(RepositoryWithCommitsPresenter.new(repository).as_json)
    end

    private
      def available_repositories
        Repository.published.localized
      end
  end
end
