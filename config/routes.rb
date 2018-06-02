Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :exemplars, only: %i[index show]
  # resources :taxons
  resources :botanists, only: %i[index show]
  resources :comments
  resources :exemplar_collections, only: :index
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'exemplars#index'
  resource :referral_pages, only: :index do
    get 'history'
    get 'employees'
    get 'news'
    get 'contacts'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
