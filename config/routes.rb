Rails.application.routes.draw do
  devise_for :users
  root "top#index"

# TODO usersのルーティング修正
  resources 'users', except: [:edit] do
    collection do
      get 'logout'
    end
  end
  
  resources :products, only: [:new, :create, :show]
end
