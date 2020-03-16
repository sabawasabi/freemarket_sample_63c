Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :top, only: [:new, :create, :show]
  resources :products, only: [:new, :create, :show]
end
