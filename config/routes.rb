Rails.application.routes.draw do
  resources :assemblies
  resources :parts
  resources :accounts
  resources :books
  resources :suppliers
  resources :authors
  root 'dashboard#index'

  namespace :api, defaults: {format: :json} do
    resources :authors
    resources :suppliers
    resources :accounts
  end
end
