Rails.application.routes.draw do
  devise_for :users

  resources :meetups do
    resources :places, only: [:index]
  end

  resources :places, only: [:show] do
    resources :place_candidates, only: [:create]
  end

  resources :place_candidates, only: [] do
    resources :votes, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "meetups#index"
end
