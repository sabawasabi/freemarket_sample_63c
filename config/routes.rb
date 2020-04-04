Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  # ログアウト用のルーティング
  devise_scope :user do
    get '/users/sign_out', to: 'users/sessions#destroy'
  end

  root "top#index"

  resources :users
  resources :products,  only: [:new, :create, :show]
  resources :credits,   only: [:index, :new, :create]
  resources :addresses, only: [:new, :create, :edit, :update]
end
