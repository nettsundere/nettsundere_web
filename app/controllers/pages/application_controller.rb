class Pages::ApplicationController < ApplicationController
  before_filter :set_locale
  
  def set_locale
    if locale_to_set = params[:locale]
      I18n.locale = locale_to_set
      default_url_options[:locale] = locale_to_set
    end
  end
end
