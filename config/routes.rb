Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :events
  resources :appointments, only: %i[create update]

  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
