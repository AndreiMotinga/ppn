Rails.application.routes.draw do
  devise_for :users

  resources :companies, only: [:show] do
    member do
      get :private
      get :public
      get :dashboard
      namespace :dashboard do
        resources :users, only: [:index]
      end
    end
  end
  resources :posts

  root to: "posts#index"
end
