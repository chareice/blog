module LoginMacros
    def log_in(user)
        visit admin_login_path
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button '登录'
    end
end