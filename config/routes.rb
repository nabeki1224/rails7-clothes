Rails.application.routes.draw do
  root "products#index"

  resources :products, only: [:show]

  resources :line_items, only: %i[create destroy]

  resources :carts, only: [:index]

  namespace :payments do
    get 'checkout'
    get 'success'
  end
end
