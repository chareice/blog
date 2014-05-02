Blog::Application.routes.draw do
  root "posts#index"
  
  resources :posts
  
  namespace :admin do
    root 'posts#index'
    resources :posts        
    resource :user
    resource :session, only: [:new, :create, :destroy]
  end

  scope controller: "admin/sessions" do
    get "/login", to: :new, as: "admin_login"
    post "/login", to: :create
    get "/logout", to: :destroy
  end
  
end