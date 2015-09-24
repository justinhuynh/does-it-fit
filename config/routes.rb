Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :brands, only: [:index]
  resources :products do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :categories, only: [:index]
end
