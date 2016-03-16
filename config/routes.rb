Rails.application.routes.draw do

  devise_for :users

  # Project root
  root "site#index"


  resources :users, only: [:show] do
    resources :projects, only: [:create, :show, :new, :index]
  end


  # resources :projects, only:[:show, :index] do

  #   resources :context_sheets, only: [:create, :show, :new, :index] do
  #     resources :contexts, only: [:new, :create, :edit, :update, :index]
  #   end

  #   resources :skeleton_sheets, only: [:create, :show, :new, :index] do
  #     resources :contexts, only: [:new, :create, :edit, :update, :index]
  #   end

  #   resources :building_sheets, only: [:create, :show, :new, :index] do
  #     resources :contexts, only: [:new, :create, :edit, :update, :index]
  #   end

  #   resources :masonry_sheets, only: [:create, :show, :new, :index] do
  #     resources :contexts, only: [:new, :create, :edit, :update, :index]
  #   end

  #   resources :timber_sheets, only: [:create, :show, :new, :index] do
  #     resources :contexts, only: [:new, :create, :edit, :update, :index]
  #   end


  # end

  resources :projects, only: [:show, :index] do
    resources :records, only: [:new, :create, :edit, :update, :index]
  end

end
