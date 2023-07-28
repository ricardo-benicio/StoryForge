Rails.application.routes.draw do
  resources :assemblies
  resources :parts
  resources :books
  resources :suppliers
  resources :authors
  root 'dashboard#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
