Rails.application.routes.draw do
  devise_for :admins
  root "site/home#index"

  namespace :app do
    root to: "dashboard#index"
    resources :shipping_companies, only: [:index, :new, :create, :show, :edit, :update]
  end
end
