Rails.application.routes.draw do
  devise_for :users
  # Project root
  root "site#index"
  resources :users, only: [:show]
  resources :projects

end
