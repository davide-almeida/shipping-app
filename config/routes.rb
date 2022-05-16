Rails.application.routes.draw do
  devise_for :admins
  root "site/home#index"

  namespace :app do
    root to: "dashboard#index"
  end
end
