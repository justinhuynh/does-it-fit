Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :brands, only: [:index]
  resources :products
  resources :categories, only: [:index]
  resources :reviews
end
