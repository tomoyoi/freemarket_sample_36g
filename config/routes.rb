Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :items do
  member do
    get 'buy'
    post 'pay'
  end
    resources :likes, only: [:create, :destroy]
  end
end
