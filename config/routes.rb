Rails.application.routes.draw do
  devise_for :users

  resources :companies

  authenticate :user, ->(u) { u.can_write? } do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :posts, only: [:index, :show]

  root to: "posts#index"
end
