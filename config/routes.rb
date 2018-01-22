require 'sidekiq/web'

Rails.application.routes.draw do
  resources :privacy_policies
  resources :photos, path: 'fotos'
  resources :events, path: 'eventos'
  resources :news, path: 'noticias'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  get 'welcome/index'
  root 'welcome#index'

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
end
