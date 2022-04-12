Rails.application.routes.draw do
  devise_for :users

  resources :meetups do
    resources :places, only: [:new, :create]
  end

  resources :places, only: [:show, :new] do
    resources :votes, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "meetups#index"
end
