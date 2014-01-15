require 'spec_helper'

describe Admin::SessionsController do
  describe "routing to session", type: :routing do
    it "routes get /login to sessions#new" do
      expect(get("/login")).
        to route_to(controller: "admin/sessions", action: "new")
    end

    it "routes post /login to session#create" do
      expect(post("/login")).
        to route_to("admin/sessions#create")
    end

    it "routes get /logout to sessions#destroy" do
      expect(get("/logout")).
        to route_to("admin/sessions#destroy")
    end

  end

  describe "GET #new" do
    it "renders :index template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valida user info" do
      subject{
        user = create(:user)
      }
      it "redirect_to admin_path when user password correct" do
        post :create, email: subject.email, password: subject.password
        expect(response).to redirect_to admin_root_path
      end
    end

    context "with invalida user info" do
      subject{
        user = create(:user)
      }
      it "redirect_to admin_login_path" do
        post :create, email: subject.email, password: "not for user"
        expect(response).to redirect_to admin_login_path
      end
    end
  end
end
