Rails.application.routes.draw do
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root 'news#index'
  resources :news
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
