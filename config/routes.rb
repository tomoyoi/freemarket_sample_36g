Rails.application.routes.draw do
<<<<<<< HEAD
  # root 'welcome#index'
  root 'items#pconfirm'
  # root 'items#sell'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  get 'static_pages/signup'
  get 'static_pages/login'
  get 'static_pages/registration'
  get 'static_pages/deliver_address'
  get 'static_pages/payment'
  get 'static_pages/complite'
  root 'welcome#index'
>>>>>>> ono0satoshi/master
end
