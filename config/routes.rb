Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :articles do
    resources :comments, only: [:new, :create]
    resource :like, only: [:create, :destroy]  # Singular resource for likes

    # post '/like', to: 'likes#create', as: 'article_like'  # New route for creating a like

    # Example nested resource route:
    # resources :likes, only: [:create]
  end

  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:index]
end
