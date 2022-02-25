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
    resources :payments, only: :new
  end
  resources :bookings, only: :destroy
  get 'my_favorites', to: 'profil#my_favorites', as: :my_favorites
  resources :profil, only: :show

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
