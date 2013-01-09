module Pages
  module Admin
    class UsersController < AdminPageController
      def index
        @users = User.all
      end

      def create
        @user = User.new(permitted)
        if @user.save
          redirect_to edit_admin_user_path(@user),
            :notice => t('pages.admin.users.created')
        else
          render :action => "new"
        end
      end

      def update
        @user = User.find(params[:id])
        if @user.update_attributes(permitted)
          redirect_to edit_admin_user_path(@user),
            :notice => t('pages.admin.users.updated')
        else
          render :action => "edit"
        end
      end

      def edit
        @user = User.find(params[:id])
      end

      def new
        @user = User.new
      end

      def destroy
        user = User.find(params[:id])
        user.delete
        redirect_to admin_users_path,
          :notice => t('pages.admin.users.deleted')
      end

      private
        def permitted
          safe_attributes = [
            :state_event,
            :login,
            :password,
            :password_confirmation
          ]

          params.require(:user).permit(*safe_attributes)
        end
    end
  end
end
