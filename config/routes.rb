Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root "site/home#index"

  namespace :app do
    root to: "dashboard#index"
    resources :shipping_companies, only: [:index, :new, :create, :show, :edit, :update] do
      resources :order_services, only: [:new, :create]
    end
    resources :order_services, only: [:index, :show]
    resources :users, only: [:index, :new, :create, :show, :edit, :update]
    # resources :search_prices, only: [:index] do
      # get "search", on: :collection
      # get "search", on: :member 
    # end
    get "search_prices", to: "search_prices#index"
    get "search_prices/search", to: "search_prices#search"
    resources :search_price_logs, only: [:index]
  end

  namespace :shipping_company do
    root to: "dashboard#index"
    resources :carriers, only: [:index, :new, :create, :show, :edit, :update]
    resources :prices, only: [:index, :new, :create, :show, :edit, :update]
    resources :price_settings, only: [:new, :create, :edit, :update]
    resources :delivery_times, only: [:index, :new, :create, :edit, :update]
    resources :order_services, only: [:index, :show, :edit, :update] do
      resources :order_routes, only: [:new, :create]
      patch 'refuse_order_service', on: :member
    end
    resources :order_routes, only: [:index, :show]
  end

  namespace :site do
    root to: "home#index"
    resources :track_routes, only: [:index]
    get "search", to: "track_routes#search"
  end

end
