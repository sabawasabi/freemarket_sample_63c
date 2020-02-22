Rails.application.routes.draw do
  get 'products/index'
  get 'products/new'
  get 'products/create'
  root "products#index"
end
