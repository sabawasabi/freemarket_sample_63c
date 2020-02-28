Rails.application.routes.draw do
  root "products#new"
  get 'products/new'
end
