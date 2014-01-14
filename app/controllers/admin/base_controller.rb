class Admin::BaseController < ActionController::Base
    #before_action :authenticate_admin!

    private
    def authenticate_admin!
        if User.count == 0
            redirect_to new_admin_user_path
        else
            
        end
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end