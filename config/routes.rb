Rails.application.routes.draw do
  get 'products/new'
  root "products#new"
end
