module Pages
  module Admin
    class AdminPageController < PageController
      include Authorization::Controller
      layout "admin_page"
      
      before_filter :redirect_to_login_unless_signed_in

      def redirect_to_login_unless_signed_in
        unless signed_in?
          redirect_to new_session_path, :notice => t('pages.admin.access_denied')
        end
        true
      end
    end
  end
end
