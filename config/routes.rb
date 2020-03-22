Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  root "top#index"


  resources :users, only: [:new, :destroy]
  resources :products, only: [:new, :create, :show]
  resources :addresses, only: [:new, :create, :edit, :update]
  resources :credits, only: [:index, :new, :create]
  
  # ログアウト用のルーティング
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
