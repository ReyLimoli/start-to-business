Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  get '/home/about_us'

  resources :ideas, only: [:show, :new, :create, :index] do
    resources :proposals, only: [:new, :create]
    member do
      post 'favorite'
      post 'unfavorite'
    end
  end

  resources :investors, only: [:index, :show]
  resources :invites, only: [:new, :create, :show]
  resources :favorite_ideas, only: [:index]
  resources :proposals, only: [:index]
end
