Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'static_pages/signup'
  get 'static_pages/login'
  get 'static_pages/registration'
  get 'static_pages/deliver_address'
  get 'static_pages/payment'
  get 'static_pages/complite'
  get 'static_pages/logout'
  # resources :users
  get 'users/mypage'
  get 'users/payment'
  get 'users/profile'
  get 'users/identification'
  get 'users/mypage'
  get 'items/sell'
  get 'items/show'
  get 'items/pconfirm'
  get 'items/edit' 
  resources :items, only: [:destroy, :edit, :update]
  get 'welcome/index'
end
