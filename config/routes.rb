Blog::Application.routes.draw do
  root "posts#index"
  namespace :admin do
    resources :posts
  end
end
