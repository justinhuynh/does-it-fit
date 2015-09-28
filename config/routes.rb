Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :brands, only: [:index]
  resources :products do
    resources :reviews, only: [:index, :new, :create] do
    end
  end
  resources :votes, only: [:create, :destroy]
  resources :categories, only: [:index]
end
