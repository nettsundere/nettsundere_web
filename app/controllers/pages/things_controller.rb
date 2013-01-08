module Pages
  class ThingsController < PageController
    def index
      @things = available_things.desc_by_date
    end

    def show
      @thing = available_things.find(params[:id])
    end

    private
      def available_things
        Thing.published.localized
      end
  end
end
