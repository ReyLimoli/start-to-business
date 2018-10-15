Rails.application.routes.draw do
  devise_for :users
  
  root to: "home#index"
  resources :ideas, only: [:show, :index]
  resources :investors, :only => [:index]

end
