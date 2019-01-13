Rails.application.routes.draw do
  # root 'welcome#index'
  # root 'items#pconfirm'
  # root 'items#sell'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static_pages/signup'
  get 'static_pages/login'
  get 'static_pages/registration'
  get 'static_pages/deliver_address'
  get 'static_pages/payment'
  get 'static_pages/complite'
  get 'users/mypage'
  get 'items/sell'
  get 'items/show'
  get 'items/pconfirm'
end
