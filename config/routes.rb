Rails.application.routes.draw do
  root to: 'drivers#index'
  resources :drivers
  resources :vehicles
end
