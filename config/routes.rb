Rails.application.routes.draw do
  use_doorkeeper

  root to: 'home#index'

  devise_for :users

  namespace :api do
  end
end
