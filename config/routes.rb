Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :bookings, only: [ :new, :create ] do
      resources :reviews, only: [ :new, :create ]
    end
  end
  resources :bookings, only: [ :edit, :update ]
  resources :reviews, only: [ :edit, :update, :destroy ]
end
