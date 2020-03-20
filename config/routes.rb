Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :products, only: [:new, :create, :show]
  resources :addresses, only: [:new, :create]
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
