# frozen_string_literal: true

Rails.application.routes.draw do
  get '/carts', to: 'carts#index'

  namespace :admin do
    resources :products, except: %i[show]
  end
  resources :products, only: %i[index show]
  root to: 'products#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
