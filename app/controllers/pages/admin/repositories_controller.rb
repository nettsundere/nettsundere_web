module Pages
  module Admin
    class RepositoriesController < AdminPageController
      def index
        @repositories = Repository.all
      end

      def create
        @repository = Repository.new(permitted)
        if @repository.save
          redirect_to edit_admin_repository_path(@repository),
            :notice => t('pages.admin.repositories.created')
        else
          render :action => "new"
        end
      end

      def update
        @repository = Repository.find(params[:id])
        if @repository.update_attributes(permitted)
          redirect_to edit_admin_repository_path(@repository),
            :notice => t('pages.admin.repositories.updated')
        else
          render :action => "edit"
        end
      end

      def edit
        @repository = Repository.find(params[:id])
      end

      def new
        @repository = Repository.new
      end

      def destroy
        repository = Repository.find(params[:id])
        repository.delete
        redirect_to admin_repositories_path,
          :notice => t('pages.admin.repositories.deleted')
      end

      private
        def permitted
          safe_attributes = [
            :state_event,
            :ru,
            :en,
            :name,
            :source,
            :description_ru,
            :description_en,
            :summary_ru,
            :summary_en,
          ]

          params.require(:repository).permit(*safe_attributes)
        end
    end
  end
end
