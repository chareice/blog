require 'spec_helper'

feature 'Admin User' do
    scenario "generate when user not exist" do
        visit admin_root_path
        expect(page.current_path).to eq new_admin_user_path
        expect{
            user = build(:user)
            fill_in 'user_name', with: user.name
            fill_in 'user_email', with: user.email
            click_button 'Create User'
        }.to_not change{User.count}

        expect(page.current_path).to eq new_admin_user_path

        expect{
            user = build(:user)
            fill_in 'user_name', with: user.name
            fill_in 'user_email', with: user.email
            fill_in 'user_password', with: user.password
            click_button 'Create User'
        }.to change{User.count}.from(0).to(1)
        expect(page.current_path).to eq admin_posts_path
    end

    scenario "need login user when request admin path and user exist" do
        create(:user)
        visit admin_root_path
        expect(page.current_path).to eq admin_login_path
    end
end