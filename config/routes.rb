Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  # resources :users do
  #   resources :tweets
  # end
end
