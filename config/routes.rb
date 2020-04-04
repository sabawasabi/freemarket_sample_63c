Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  root "top#index"


  resources :users, only: [:new, :destroy]
  resources :products, only: [:new, :create, :show]
  resources :credits, only: [:new, :show, :destroy] do
    collection do
      post 'pay_show', to: 'credits#pay_show'
      post 'pay', to: 'credits#pay'
    end
  end

  resources :transactions, only: [:index] do
    collection do
      get 'pay_index', to: 'transactions#pay_index'
      post 'pay', to: 'transactions#pay'
      get 'done', to: 'transactions#done'
    end
  end

  # ログアウト用のルーティング
  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end
end
