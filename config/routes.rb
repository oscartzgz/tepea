Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root "news#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    # get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  
  get 'gallery', to: 'gallery#index'
  resources :users, only: %i[show]
  namespace :user do
    resources :pictures, only: %i[new create]
  end

  namespace :admin do
    get '/', to: 'admin#index'
    resources :municipalities, only: %i[index edit update]
    resources :news, only: %i[index update]
  end
end
