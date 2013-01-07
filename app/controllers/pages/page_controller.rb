module Pages
  class PageController < ApplicationController
    layout "page"
    include Localization::Controller

    def available_banners
      Banner.published.localized
    end
    helper_method :available_banners
  end
end
