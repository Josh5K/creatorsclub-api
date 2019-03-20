# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  config = ActiveAdmin::Devise.config
  devise_for :admin_users, config
  ActiveAdmin.routes(self)
  root to: redirect('/admin')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :orders
      resources :users
      resources :comments
      resources :replies
      resources :sellers
      resources :products
      resources :variants
      resources :events

      # Get
      get 'sync/products', to: 'sync#products'
      get 'sync/variants', to: 'sync#variants'
      get 'users/seller/:category', to: 'users#sellers'
      # Post
      post 'users/signin', to: 'users#signin'
      # post 'users/create', to: 'users#create'
      post 'sellers/link', to: 'sellers#link'
    end
  end
end
