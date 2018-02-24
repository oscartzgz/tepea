require 'sidekiq/web'

Rails.application.routes.draw do
  get 'expressions/index'

  resources :articles
  resources :application_settings
  get 'dashboard/index'
  get 'dashboard/users'
  get 'dashboard/application_settings'

  resources :privacy_policies do
    collection do
      get 'current'
    end
  end
  resources :photos, path: 'fotos'
  resources :events, path: 'eventos'
  resources :news, path: 'noticias' do
    collection do
      get 'preview'
    end
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  get 'welcome/index'
  root 'welcome#index'

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
end
