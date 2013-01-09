module Pages
  module Admin
    class ContentsController < AdminPageController
      def index
        @contents = Content.all
      end

      def create
        @content = Content.new(permitted)
        if @content.save
          redirect_to edit_admin_content_path(@content),
            :notice => t('pages.admin.contents.created')
        else
          render :action => "new"
        end
      end

      def update
        @content = Content.find(params[:id])
        if @content.update_attributes(permitted)
          redirect_to edit_admin_content_path(@content),
            :notice => t('pages.admin.contents.updated')
        else
          render :action => "edit"
        end
      end

      def edit
        @content = Content.find(params[:id])
      end

      def new
        @content = Content.new
      end

      def destroy
        content = Content.find(params[:id])
        
        if content.predefined
          redirect_to admin_contents_path,
            :notice => t('pages.admin.contents.cannot_be_deleted')
        else
          content.delete
          redirect_to admin_contents_path,
            :notice => t('pages.admin.contents.deleted')
        end
      end

      private
        def permitted
          safe_attributes = [
            :state_event,
            :ru,
            :en,
            :symbolic_name,
            :alias_ru,
            :alias_en,
            :title_ru,
            :title_en,
            :text_ru,
            :text_en
          ]

          params.require(:content).permit(*safe_attributes)
        end
    end
  end
end
