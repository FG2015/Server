Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # Root
  root to: "home#index"

  post 'auth/sign_in', to: 'auth#signin'
  post 'auth/sign_up', to: 'auth#signup'

end
