module Pages
  class SessionsController < PageController
    include Authorization::Controller
    layout "login"
    
    def new
    end

    def create
      if params[:user]
        login = params[:user][:login]
        password = params[:user][:password]
      end

      if user = User.enabled.find_by_login(login).try(:authenticate, password)
        sign_in(user)
        redirect_to admin_root_path
      else
        flash[:notice] = t('pages.sessions.login_failed')
        render :new
      end
    end

    def destroy
      sign_out!
      redirect_to root_path
    end
  end
end
