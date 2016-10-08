Rails.application.routes.draw do

  devise_for :users
  resources :movies, only: [:index, :show]
  devise_scope :user do
    authenticated do
      root 'movies#index'
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
end
