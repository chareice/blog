Blog::Application.routes.draw do
  root "posts#index"
  namespace :admin do
    root 'posts#index'
    resources :posts
    resource :session
    resource :user
  end
end
