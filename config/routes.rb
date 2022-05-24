Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root "site/home#index"

  namespace :app do
    root to: "dashboard#index"
    resources :shipping_companies, only: [:index, :new, :create, :show, :edit, :update]
    resources :users, only: [:index, :new, :create, :show, :edit, :update]
    # resources :search_prices, only: [:index] do
      # get "search", on: :collection
      # get "search", on: :member 
    # end
    get "search_prices", to: "search_prices#index"
    get "search_prices/search", to: "search_prices#search"
  end

  namespace :shipping_company do
    root to: "dashboard#index"
    resources :carriers, only: [:index, :new, :create, :show, :edit, :update]
    resources :prices, only: [:index, :new, :create, :show, :edit, :update]
    resources :price_settings, only: [:index, :new, :create, :edit, :update]
    resources :delivery_times, only: [:index, :new, :create, :edit, :update]
  end
end
