Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :bookings, only: [ :new, :create, ] do
      resources :reviews, only: [ :new, :create ]
    end
  end
  resources :bookings, only: [ :show, :edit, :update ]
  resources :reviews, only: [ :edit, :update, :destroy ]
  resources :users, only: :show
  resources :hosts, only: [ :show, :edit, :update ]
end
