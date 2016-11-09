Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :show]

  resources :companies, only: [:show] do
    member do
      get :private
      get :public
    end
  end

  namespace :dashboard do
    resources :posts, except: :show
    # resources :investors, only: [:index]
  end

  root to: "posts#index"
end
