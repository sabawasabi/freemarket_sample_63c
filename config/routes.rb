Rails.application.routes.draw do
  devise_for :users
  root "users#show"
  # root "top#index"
  resources :products, only: [:new, :create]

  # ユーザー
  resources 'users', except: [:edit] do
    collection do
      get 'logout'
    end
  end

end
