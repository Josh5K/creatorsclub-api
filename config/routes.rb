Rails.application.routes.draw do
  config = ActiveAdmin::Devise.config
  devise_for :admin_users, config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :orders
      resources :users
      resources :comments
      resources :replies
      resources :sellers
      resources :products
      get 'users/seller/:category', to: 'users#sellers'
    end
  end
end
