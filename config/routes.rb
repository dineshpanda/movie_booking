Rails.application.routes.draw do

  devise_for :users
  resources :movies, only: [:index, :show]
  resources :bookings do
    collection do
      get :validate_coupon
    end
  end
  root 'movies#index'
end
