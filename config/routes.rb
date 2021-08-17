Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rockets, only: [:index, :show, :new, :create ] do
    resources :bookings, only: [:new, :create] do
      resources :reviews, only: [:new, :create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
