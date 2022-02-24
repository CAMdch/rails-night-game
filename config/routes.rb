Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games do
    resources :bookings, only: %i[create index]
    resources :reviews, only: %i[create]
  end

  resources :bookings do
    member do
      patch 'decline'
      patch 'accept'
    end
    resources :payments, only: :new
  end

  resources :profil, only: :show

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
