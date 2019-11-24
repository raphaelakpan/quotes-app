Rails.application.routes.draw do
  resources :quotes, only: [:create]
  resources :authors, only: [:index]
  root "quotes#index"
end
