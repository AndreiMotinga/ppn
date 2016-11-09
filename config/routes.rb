Rails.application.routes.draw do
  devise_for :users

  resources :companies do
    member do
      get :contacts
    end
  end
  resources :posts

  root to: "posts#index"
end
