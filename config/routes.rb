# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :products_cart do
    resources :products, only: %i[create destroy]
    get '/items', to: 'carts#index'
  end

  namespace :checkout do
    resources :purchase_histories, only: %i[create update]
  end

  namespace :admin do
    resources :products, except: %i[show]
    resources :purchase_histories, only: %i[index show]
  end
  resources :products, only: %i[index show]
  root to: 'products#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
