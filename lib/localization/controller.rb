module Localization
  module Controller
    class << self
      def included(base)
        base.class_eval do
          before_filter :set_locale
        end
      end
    end
    
    def set_locale
      if locale_to_set = params[:locale]
        I18n.locale = locale_to_set
      else
        I18n.locale = I18n.default_locale
      end
    end

    def url_options
      if I18n.locale != I18n.default_locale
        super.reverse_merge(:locale => I18n.locale)
      else
        super
      end
    end
  end
end
