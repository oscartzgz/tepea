Rails.application.routes.draw do
  root 'news#index'
  resources :news
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
