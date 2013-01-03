module Localization
  module Routes
    def explicit_locale_regexp
      possible_explicit_locales = I18n.available_locales - [I18n.default_locale]
      Regexp.new("#{possible_explicit_locales.join('|')}")
    end
  end
end
