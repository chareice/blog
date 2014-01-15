class Admin::BaseController < ActionController::Base
    before_action :authenticate_admin!
    include Admin::SessionsHelper

    private
    def authenticate_admin!
        if User.count == 0
            redirect_to new_admin_user_path
        else
            unless current_user
                redirect_to admin_login_path
            end
        end
    end
end