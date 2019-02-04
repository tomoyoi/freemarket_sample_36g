Rails.application.routes.draw do
  devise_for :users, :controller => {
    :registration => 'signup/registrations'
  }

  devise_scope :user do
   get 'signup' => 'signup/registrations#index'
   get 'signup/registration' => 'signup/registrations#new'
   post 'signup/address' => 'signup/registrations#address'
   post 'signup/complite' => 'sifgnup/registrations#complete'
   post 'signup/complite' => 'signup/registrations#complite'
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
  get 'welcome/index'
end
