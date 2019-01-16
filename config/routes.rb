Rails.application.routes.draw do
  root 'welcome#index'
  get 'static_pages/signup'
  get 'static_pages/login'
  get 'static_pages/registration'
  get 'static_pages/deliver_address'
  get 'static_pages/payment'
  get 'static_pages/complite'
<<<<<<< HEAD
  get 'users/payment'
  root 'welcome#index'
=======
  get 'users/mypage'
  get 'users/payment'
  get 'users/profile'
  get 'users/mypage-edit'
  get 'items/sell'
  get 'items/show'
  get 'items/pconfirm'
>>>>>>> ono0satoshi/master
end
