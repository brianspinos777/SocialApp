Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :friendships do
    collection do
      post 'add_friend'         # add_friend_friendships_path
      post 'unfriend'           # unfriend_friendships_path
      post 'cancel_request'     # cancel_request_friendships_path
      post 'accept_friendship'  # accept_friendship_friendships_path
    end
  end

  resources :notifications
  resources :reactions
  resources :comments
  resources :videos
  resources :photos

  get 'home/index'


  #======= DEVISE

  # `devise_for` should come before `resources :users`
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  #=======

  root to: "home#index"

end
