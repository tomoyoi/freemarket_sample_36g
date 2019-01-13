Rails.application.routes.draw do
  root 'welcome#index'
  get   'users'  =>  'users#mypage'
  get   'users/payment'
end
