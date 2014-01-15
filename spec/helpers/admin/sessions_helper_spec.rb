require 'spec_helper'

describe Admin::SessionsHelper do
    describe "#current_user" do
        it "return nil when session[:user_id] is nil" do
            session[:user_id] = nil
            expect(helper.current_user).to eq nil
        end

        it "return user object when session[:user_id] has a id for user" do
            user = create(:user)
            session[:user_id] = user.id
            expect(helper.current_user).to eq user
        end
    end

    describe "#login" do
        it "set user id to session" do
            user = create(:user)
            helper.login(user)
            expect(session[:user_id]).to eq user.id
        end
    end
end