Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin,controllers: {
    registrations: "admin/registrations",
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :customers, only: [:destroy] # ここを追加
  end
  
  namespace :public do
    resources :customers, only: [:show, :edit, :update]
  end
  
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
