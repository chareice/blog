class Admin::SessionsController < ApplicationController
  include Admin::SessionsHelper
  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.auth(email, password)
    if user
        login(user)
        redirect_to admin_root_path
    else
        redirect_to admin_login_path
    end
  end

  def destroy
    
  end
end
