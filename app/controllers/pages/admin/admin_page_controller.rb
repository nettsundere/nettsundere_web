module Pages
  module Admin
    class AdminPageController < PageController
      layout "admin_page"

      def ckeditor_before_create_asset(asset)
        raise RuntimeError, "Access denied" # TODO
        true
      end
    end
  end
end
