Rails.application.routes.draw do
  root "users#index"
  get 'users/index'
  get 'users/registration'
  get 'users/signin'
end
