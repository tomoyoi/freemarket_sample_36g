Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  get 'users/mypage'
  get 'users/payment'
  get 'users/profile'
  get 'users/identification'
  get 'users/mypage-edit'
  resources :users, only: [:index, :new] do
    get :mypage, on: :member
  end
  post 'users/confirm' => 'users#confirm'
<<<<<<< HEAD
  get 'items/sell'
  get 'items/pconfirm'
  get 'items/edit'
=======
>>>>>>> ono0satoshi/master
  get 'welcome/index'
  resources :items do
    get :buy, on: :member
    post :pay, on: :member
    resources :likes, only: [:create, :destroy]
  end

  resources :categories, only: [:index, :new, :create]
  resources :sizes, only: [:index, :new, :create]
end
