Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise_for :users
  mount_devise_token_auth_for 'User', at: 'auth'
  # Root
  root to: "home#index"

end
