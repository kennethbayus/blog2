Rails.application.routes.draw do
  root to: 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts
  resources :users, only: [:new, :create, :edit, :update]

  resources :categories, only: [:new, :create, :show, :edit, :update, :destroy]

end
