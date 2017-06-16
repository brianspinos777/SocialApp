Rails.application.routes.draw do
  resources :friendships
  resources :notifications
  resources :reactions
  resources :comments
  resources :videos
  resources :photos
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # `devise_for` should come before `resources :users`
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users

  root to: "home#index"

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end


end
