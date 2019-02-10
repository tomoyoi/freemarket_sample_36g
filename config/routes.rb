Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  root 'items#index'
  get 'static_pages/signup'
  get 'static_pages/login'
  get 'static_pages/registration'
  get 'static_pages/deliver_address'
  get 'static_pages/payment'
  get 'static_pages/complite'
  get 'static_pages/logout'
  get 'users/mypage'
  get 'users/payment'
  get 'users/profile'
  get 'users/identification'
  get 'users/mypage-edit'
  get 'items/sell'
  get 'items/show'
  get 'items/pconfirm'
  get 'items/edit'
  get 'welcome/index'
end
