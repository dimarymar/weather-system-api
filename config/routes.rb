Rails.application.routes.draw do
  use_doorkeeper

  root to: 'home#index'

  devise_for :users, controllers: { sessions: 'devise/custom_sessions' }

  namespace :api, defaults: { format: :json } do
    resources :observations, only: %w(index)
  end
end
