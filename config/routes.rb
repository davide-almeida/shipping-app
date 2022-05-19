Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root "site/home#index"

  namespace :app do
    root to: "dashboard#index"
    resources :shipping_companies, only: [:index, :new, :create, :show, :edit, :update]
    resources :users, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :shipping_company do
    root to: "dashboard#index"
    resources :carriers, only: [:index, :new, :create, :show, :edit, :update]
  end
end
