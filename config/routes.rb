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
    resources :dashboards, only: [:show]
    resources :customers, only: [:destroy, :update] # ここを追加
    resources :items, only: [ :new, :index, :show, :create, :edit, :update, :destroy]
  end
  
  namespace :public do
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [ :index, :show]
  end
  
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
