Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  root "top#index"


  resources :users, only: [:new, :destroy]
  resources :products, only: [:new, :create, :show]
  resources :credits, only: [:index, :new, :create, :destroy] do
    collection do
      post 'pay_show', to: 'credits#pay_show'
      post 'pay', to: 'credits#pay'
    end
  end

  # ログアウト用のルーティング
  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end
end
