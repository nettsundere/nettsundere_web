module Pages
  class PageController < ApplicationController
    layout "page"
    include Localization::Controller
  end
end
