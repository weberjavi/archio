Rails.application.routes.draw do

  devise_for :users

  # Project root
  root "site#index"


  resources :users, only: [:show] do
    resources :projects, only: [:create, :show, :new, :index, :edit, :update, :destroy]
  end

  # Añade un usuario al proyecto. Acción llamada desde un boton en view/projects/_add_user_to_project
  post "/projects/:id/add_user" => "projects#add_user_to_project"

  # Ruta que devuelve un geoJson. Llamada desde un AJAX en home.js
  get "/projects/map_elements" => "projects#geoJson_projects"

  resources :projects, only: [:show, :index] do
    resources :records, only: [:new, :create, :index, :update, :destroy]
  end

  resources :projects, only: [:show, :index] do
    resources :building_sheets, only: [:new, :create, :edit, :update, :index, :destroy]
  end

  resources :projects, only: [:show, :index] do
    resources :context_sheets, only: [:new, :create, :edit, :update, :index, :destroy]
  end

  resources :projects, only: [:show, :index] do
    resources :masonry_sheets, only: [:new, :create, :edit, :update, :index, :destroy]
  end

  resources :projects, only: [:show, :index] do
    resources :skeleton_sheets, only: [:new, :create, :edit, :update, :index, :destroy]
  end

  resources :projects, only: [:show, :index] do
    resources :timber_sheets, only: [:new, :create, :edit, :update, :index, :destroy]
  end

  resources :projects, only: [:show, :index] do
    resources :contexts, only: [:show, :edit, :update]
  end


end
