Rails.application.routes.draw do
  resources :assembly_parts
  resources :assemblies
  resources :parts
  resources :accounts
  resources :books
  resources :suppliers
  resources :authors
  root 'dashboard#index'

  namespace :api, defaults: { format: :json } do
    resources :authors, :books
  end
end
