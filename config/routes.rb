Rails.application.routes.draw do
  devise_for :users

  resources :companies, only: [:show] do
    member do
      get :private
      get :public
      namespace :dashboard do
        resources :posts, only: [:index]
        resources :investors, only: [:index]
      end
    end
  end
  resources :posts, only: [:index, :show]

  root to: "posts#index"
end
