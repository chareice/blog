require 'spec_helper'

describe Admin::UsersController do
    describe "GET #new" do
        it "renders :new template" do
            get :new
            expect(response).to render_template :new
        end

        it "assigns a new User" do
            get :new
            expect(assigns(:user).attributes).to eq User.new.attributes
        end
    end

    describe "Post #create" do
        it "creates user when user not exist and user valid" do
            expect{
                post :create, user: attributes_for(:user)
            }.to change{User.count}
        end

        it "not creates user when user exist" do
            create(:user)
            expect{
                post :create, user: attributes_for(:user)
            }.to_not change{User.count}
        end

        it "not creates user when invalid user" do
            expect{
                post :create, user: attributes_for(:user, password: nil)
            }.to_not change{User.count}   
        end
    end
end
