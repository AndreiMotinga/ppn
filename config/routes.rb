Rails.application.routes.draw do
  resources :companies
  devise_for :users
  resources :posts
  root to: "posts#index"
end
