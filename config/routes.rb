Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games do
    resources :bookings, only: %i[create index]
    resources :reviews, only: %i[create]
    resources :favorites, only: %i[create destroy]
  end

  resources :bookings do
    member do
      patch 'decline'
      patch 'accept'
    end
  end

  resources :bookings, only: :destroy
  resources :profil, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
