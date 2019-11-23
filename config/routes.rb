Rails.application.routes.draw do
  resources :quotes, only: [:create]
  root "quotes#index"
end
