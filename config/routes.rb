Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :bookings, only: [ :new, :create, ]
  end
  resources :bookings, only: [ :show, :edit, :update ] do
    resources :reviews, only: [ :new, :create ]
  end
  resources :reviews, only: [ :edit, :update, :destroy ]
  resources :users, only: :show
end
