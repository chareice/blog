class Admin::UsersController < ApplicationController
    before_action :user_not_exists
    
    def new
     @user = User.new
    end
    
    def create
     user = User.new user_params
     if user.save
        redirect_to admin_posts_path
     else
        redirect_to action: :new
     end
    end
    
    private
    def user_not_exists
        unless User.count == 0
            redirect_to admin_posts_path
        end
    end

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end 
end
