Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # `devise_for` should come before `resources :users`
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users

  root to: "users#index"

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end


end
