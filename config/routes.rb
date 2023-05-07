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

get "search" => "searches#search"

scope module: :member do
resources :posts
resources :users,only:[:show,:edit]
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
