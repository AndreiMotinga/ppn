Rails.application.routes.draw do

  authenticate :user, ->(u) { u.superadmin? } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

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
    resources :investors, only: [:index]
    resources :company_investors, only: [:create, :destroy]
    resources :companies, only: [:edit, :update]
  end

  root to: "posts#index"
end
