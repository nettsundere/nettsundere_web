module Pages
  module Admin
    class ThingsController < AdminPageController
      def index
        @things = Thing.all
      end

      def create
        @thing = Thing.new(permitted)
        if @thing.save
          redirect_to edit_admin_thing_path(@thing),
            :notice => t('pages.admin.things.created')
        else
          render :action => "new"
        end
      end

      def update
        @thing = Thing.find(params[:id])
        if @thing.update_attributes(permitted)
          redirect_to edit_admin_thing_path(@thing),
            :notice => t('pages.admin.things.updated')
        else
          render :action => "edit"
        end
      end

      def edit
        @thing = Thing.find(params[:id])
      end

      def new
        @thing = Thing.new
      end

      def destroy
        thing = Thing.find(params[:id])
        thing.delete
        redirect_to admin_things_path,
          :notice => t('pages.admin.things.deleted')
      end

      private
        def permitted
          safe_attributes = [
            :ru,
            :en,
            :name_ru,
            :name_en,
            :text_ru,
            :text_en,
            :summary_ru,
            :summary_en,
            :date
          ]

          params.require(:thing).permit(*safe_attributes)
        end
    end
  end
end
