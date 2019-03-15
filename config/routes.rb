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
  get 'welcome/index'
  resources :items do
    get :buy, on: :member
    post :pay, on: :member
    resources :likes, only: [:create, :destroy]
  end
end
