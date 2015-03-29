Rails.application.routes.draw do
  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # Root
  root to: "home#index"

  # Auth
  devise_for :users
  post 'auth/sign_in', to: 'auth#signin'
  post 'auth/sign_up', to: 'auth#signup'

  namespace :api do
    resources  :tasks, only: [:index, :show]
  end
end
