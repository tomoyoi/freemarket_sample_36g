Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :items do
    resources :likes, only: [:create, :destroy]
    get 'pconfirm'
  end
end
