module Pages
  module PageHelper
    include Localization::LocaleLogic

    def url_for_other_locale(other_locale)
      new_params = locale_hash_parameter(other_locale)

      if controller.is_a?(Pages::ContentsController)
        if params[:id]
          current_alias_name = Content.localized_name(:alias)
          other_alias_name = Content.localized_name(:alias, other_locale)
          other_version = Content.published.version(other_locale) \
            .where(current_alias_name => params[:id]) \
            .first

          if other_version
            new_params[:id] = other_version.send(other_alias_name)
          end
        end
      end

      url_for(new_params)
    end
  end
end
