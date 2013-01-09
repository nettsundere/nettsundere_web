module Pages
  module Admin
    class BannersController < AdminPageController
      def index
        @banners = Banner.all
      end

      def create
        @banner = Banner.new(permitted)
        if @banner.save
          redirect_to edit_admin_banner_path(@banner),
            :notice => t('pages.admin.banners.created')
        else
          render :action => "new"
        end
      end

      def update
        @banner = Banner.find(params[:id])
        if @banner.update_attributes(permitted)
          redirect_to edit_admin_banner_path(@banner),
            :notice => t('pages.admin.banners.updated')
        else
          render :action => "edit"
        end
      end

      def edit
        @banner = Banner.find(params[:id])
      end

      def new
        @banner = Banner.new
      end

      def destroy
        banner = Banner.find(params[:id])
        banner.delete
        redirect_to admin_banners_path,
          :notice => t('pages.admin.banners.deleted')
      end

      private
        def permitted
          safe_attributes = [
            :state_event,
            :ru,
            :en,
            :message_ru,
            :message_en
          ]

          params.require(:banner).permit(*safe_attributes)
        end
    end
  end
end
