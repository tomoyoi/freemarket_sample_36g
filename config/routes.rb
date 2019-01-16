Rails.application.routes.draw do
  get 'static_pages/signup'
  get 'static_pages/login'
  get 'static_pages/registration'
  get 'static_pages/deliver_address'
  get 'static_pages/payment'
  get 'static_pages/complite'
  get 'users/payment'
  root 'welcome#index'
end
