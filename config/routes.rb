Rails.application.routes.draw do
  resources :photos
  resources :events, path: 'eventos'
  resources :news, path: 'noticias'
  devise_for :users
  resources :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
