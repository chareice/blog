Blog::Application.routes.draw do
  root "posts#index"
  resources :posts
  namespace :admin do
    root 'posts#index'
    resources :posts
    resource :session
    resource :user
  end

  get "/login", to: "admin/sessions#new", as: "admin_login"
  post "/login", to: "admin/sessions#create"
  get "/logout", to: "admin/sessions#destroy"
end
