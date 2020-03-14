Rails.application.routes.draw do
  devise_for :users
  
# TODO usersのルーティング修正
#   resources 'users', except: [:edit] do
#     collection do
#       get 'logout'
#     end
#   end
  
  root "top#index"
  resources :products, only: [:new, :create, :show]
end
