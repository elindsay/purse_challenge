Rails.application.routes.draw do
  root to: "orders#new"
  resources :orders, only: [:new, :create, :show, :index]
  namespace :admin do
    root to: "orders#index"
    resources :orders, only: [:index]
  end
end
