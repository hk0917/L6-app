Rails.application.routes.draw do
  root 'top#main'
  get 'top/main'

  resources :products
  resources :cart_items, only: [:new, :create, :destroy]
  resources :carts, only: [:show]
end