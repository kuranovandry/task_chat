Rails.application.routes.draw do
  devise_for :users

  root to: 'workers#index'
  resources :workers do
    resources :comments
  end
  # mount ActionCable.server => '/cable'
end
