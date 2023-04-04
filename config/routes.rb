Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :posts
      resources :visits

      root to: "users#index"
    end
  #  get 'posts/create'
  #  get 'users/show'
  #  get 'home/index'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        passwords: 'users/passwords',
        registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'home#index'
  resources :users, only: [:show]
  resources :posts, only: [:create]

  namespace :api, { format: 'json' } do
    resources :users, :only => [:show]
  end
end
