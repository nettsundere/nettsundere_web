module Authorization
  module Controller
    def signed_in?
      current_user != nil
    end

    def sign_out!
      @current_user = nil
      reset_session
    end

    def sign_in(user)
      reset_session
      session[:user_id] = user.id
    end

    def current_user
      @current_user ||= User.enabled.find_by_id(session[:user_id])
    end
  end
end
