Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  
  resources :items do
    resources :orders, only: [:index, :create]
    root to: 'items#index'
  end
end