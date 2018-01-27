require 'sidekiq/web'

Rails.application.routes.draw do
  get 'dashboard/index'

  get 'dashboard/users'

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
