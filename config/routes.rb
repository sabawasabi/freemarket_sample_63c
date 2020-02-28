Rails.application.routes.draw do

  root "top#index"
  resources :products, only: [:new, :create]
end