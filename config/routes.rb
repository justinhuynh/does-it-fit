Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :users, only: [:index, :destroy, :show, :edit]
  resources :brands, only: [:index]
  resources :products do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :reviews, only: [] do
    resources :votes, only: [:create, :destroy]
  end
  resources :categories, only: [:index, :show]
end
