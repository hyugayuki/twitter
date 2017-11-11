Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :users do
    collection do
      get :following, :followers
    end
  end
  resources :tweets do
    resources :images
  end
  resources :relationships, only: [:create, :destroy]
end
