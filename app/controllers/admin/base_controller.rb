class Admin::BaseController < ActionController::Base
    before_filter :authenticate_user!
end