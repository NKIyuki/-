Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "member/registrations",
    sessions: 'member/sessions'
  }
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }

  scope module: :member do
  root 'homes#top'
  get "search" => "posts#search"
  get 'confirm' => 'users#confirm'
  delete 'withdrawal' => 'users#withdrawal'
  resources :posts
  resources :users,only:[:show,:edit,:update,:index,:destroy ]do
    post 'guest_sign_in' => 'users#new_guest'
  end
  resources :posts,only:[:new,:create,:index,:show,:destroy] do
    resources :comments,only:[:create, :show, :destroy]
    resource :favorites,only:[:create,:destroy]
    end
  end

  namespace :admin do
  resources :posts do
    resources :comments
  end
  resources :users
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
