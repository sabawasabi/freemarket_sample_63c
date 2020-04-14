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

  root 'products#index'

  resources :users
  resources :categories, only: [:index, :show]
  resources :products,  only: [:index, :new, :create,  :show, :edit, :update] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
  end
  resources :credits,   only: [:index, :new, :create]
  resources :addresses, only: [:new, :create, :edit, :update]
end
