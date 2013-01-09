module Pages
  class ContentsController < PageController
    def show
      localized_alias = Content.localized_name(:alias)
      @content = available_content.where(localized_alias => params[:id]).first!
    end

    private
      def available_content
        Content.published.localized
      end
  end
end
