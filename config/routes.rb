Rails.application.routes.draw do
  get 'products/create'
  root "products#create"
end
