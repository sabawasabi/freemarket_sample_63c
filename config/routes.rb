Rails.application.routes.draw do
  devise_for :users
  root "users#show"
  # root "top#index"
  resources :products, only: [:new, :create]
end
