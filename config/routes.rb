Rails.application.routes.draw do
  devise_for :users
  # Project root
  root "site#index"

end
