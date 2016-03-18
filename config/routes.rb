Rails.application.routes.draw do

  devise_for :users

  # Project root
  root "site#index"


  resources :users, only: [:show] do
    resources :projects, only: [:create, :show, :new, :index]
  end




  resources :projects, only: [:show, :index] do
    resources :records, only: [:new, :create, :edit, :update, :index]
  end

end
