Rails.application.routes.draw do

  devise_for :users
  resources :movies, only: [:index, :show]
  resources :bookings
  root 'movies#index'
end
