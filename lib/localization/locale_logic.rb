module Localization
  module LocaleLogic
    def locale_hash_parameter(new_locale)
      if new_locale == I18n.default_locale
        { :locale => nil }
      else
        { :locale => new_locale }
      end
    end
  end
end
