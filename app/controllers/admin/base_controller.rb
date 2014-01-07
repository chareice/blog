class Admin::BaseController < ActionController::Base
    before_filter :authenticate_admin!

    private
    def authenticate_admin!
        if User.count == 0
            redirect_to new_admin_user_path
        else
            
        end
    end
end