Rails.application.routes.draw do
  get 'users/index'
  get 'users/registration'
  get 'users/signin'
  root "users#index"
end
