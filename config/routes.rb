Rails.application.routes.draw do
  devise_for :safety_managers
  root to: 'drivers#index'
  resources :drivers
  resources :vehicles
end
