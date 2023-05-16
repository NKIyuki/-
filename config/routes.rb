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
  resources :posts
  resources :users,only:[:show,:edit,:update,:index,:destroy ]
  resources :posts,only:[:new,:create,:index,:show,:destroy] do
    resources :comments,only:[:create, :show, :destroy]
    resource :favorites,only:[:create,:destroy]
    end
  get "search" => "posts#search"
  root 'homes#top'
  get 'confirm' => 'users#confirm'
  delete 'withdrawal' => 'users#withdrawal'
  end

  namespace :admin do
  resources :posts do
    resources :comments
  end
  resources :users
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
