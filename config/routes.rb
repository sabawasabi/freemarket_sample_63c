Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  root "top#index"


  resources :users, only: [:new, :destroy]
  resources :products, only: [:new, :create, :show, :edit, :update]
  resources :credits, only: [:index, :new, :create]

  # ログアウト用のルーティング
  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end
end
