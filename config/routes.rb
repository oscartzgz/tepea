require 'sidekiq/web'

Rails.application.routes.draw do
  resources :photos, path: 'fotos'
  resources :events, path: 'eventos'
  resources :news, path: 'noticias'
  devise_for :users
  resources :users
  get 'welcome/index'
  root 'welcome#index'

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
