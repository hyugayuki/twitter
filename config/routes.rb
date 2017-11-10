Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :users
  resources :tweets do
    resources :images
  end
  resources :relationships, only: [:create, :destroy]
end
