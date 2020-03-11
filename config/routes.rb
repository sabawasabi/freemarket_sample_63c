Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :products, only: [:new, :create]
  resources :credit, only: [:new, :create]
end
