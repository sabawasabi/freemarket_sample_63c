Rails.application.routes.draw do
  get 'products/index'
  get 'products/registration'
  get 'products/signin'
  root "products#index"
end
