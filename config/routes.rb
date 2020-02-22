Rails.application.routes.draw do
  get 'products/index'
  get 'products/registration'
  get 'products/signup'
  root "products#index"
end
