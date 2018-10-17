Rails.application.routes.draw do
  devise_for :users
  
  root to: "home#index"
  
  resources :ideas, only: [:show, :new, :create, :index] do
    member do
      post 'favorite'
      post 'unfavorite'
    end
  end

  resources :investors, only: [:index, :show]

end
