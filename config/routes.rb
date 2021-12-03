Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :bookings, only: [ :new, :create ]
  end
  resources :bookings, only: [ :edit, :update ]
end
