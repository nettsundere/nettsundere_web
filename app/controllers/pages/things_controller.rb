module Pages
  class ThingsController < PageController
    def index
      @things = available_things.desc_by_date
    end

    def show
      localized_name = Thing.localized_name(:name)
      @thing = available_things.where(localized_name => params[:id]).first!
    end

    private
      def available_things
        Thing.published.localized
      end
  end
end
