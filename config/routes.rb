Rails.application.routes.draw do
  devise_for :users

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  root to: 'workers#index'
  resources :workers do
    resources :comments
  end
  # mount ActionCable.server => '/cable'
end
