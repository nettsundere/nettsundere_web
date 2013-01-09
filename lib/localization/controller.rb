module Localization
  module Controller
    include LocaleLogic

    class << self
      def included(base)
        base.class_eval do
          before_filter :set_locale
        end
      end
    end
    
    def set_locale
      if (locale_to_set = params[:locale]) \
        && I18n.available_locales.include?(locale_to_set.intern)

        I18n.locale = locale_to_set
      else
        I18n.locale = I18n.default_locale
      end
    end

    def url_options
      super.reverse_merge(locale_hash_parameter(I18n.locale))
    end
  end
end
