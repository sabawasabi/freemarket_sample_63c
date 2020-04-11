Rails.application.routes.draw do
  #デバイス関係のルーティング
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  #ログアウトのルーティング
  devise_scope :user do
    get '/users/sign_out', to: 'users/sessions#destroy'
  end

  #ルート
  root 'products#index'

  #ユーザー情報のルーティング
  resources :users, except: :index do
    collection do
      get 'logout'
    end
    resources :addresses, only: [:new, :create, :edit, :update]
  end

  #カテゴリのルーティング
  resources :categories, only: [:index, :show]
  resources :products,  only: [:new, :create,  :show] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
  end

  #クレジットカードのルーティング
  resources :credits, only: [:new, :show, :destroy] do
    collection do
      post 'pay_show', to: 'credits#pay_show'
      post 'pay', to: 'credits#pay'
    end
  end

  #取引履歴のルーティング
  resources :transactions, only: [:index] do
    collection do
      get 'pay_index', to: 'transactions#pay_index'
      post 'pay', to: 'transactions#pay'
      get 'done', to: 'transactions#done'
    end
  end
end



