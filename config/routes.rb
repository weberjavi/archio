Rails.application.routes.draw do

  devise_for :users

  # Project root
  root "site#index"


  resources :users, only: [:show] do
    resources :projects, only: [:create, :show, :new, :index, :edit, :update, :destroy]
  end

  # Añade un usuario al proyecto. Acción llamada desde un boton en view/projects/_add_user_to_project
  post "/projects/:id/add_user" => "projects#add_user_to_project"

  # Añade un usuario al proyecto. Acción llamada desde un boton en view/projects/_add_user_to_project
  get "/projects/:id/add_admin" => "projects#add_admin_to_project", as: :add_admin_project
  # Añade un usuario al proyecto. Acción llamada desde un boton en view/projects/_add_user_to_project
  get "/projects/:id/delete_user" => "projects#delete_user"

  # Ruta que devuelve un geoJson. Llamada desde un AJAX en home.js
  get "/projects/map_elements" => "projects#geoJson_projects"

  # Ruta que devuelve un geoJson. Llamada desde un AJAX en .js
  get "/projects/map_project" => "projects#geoJson_individual_project"

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
