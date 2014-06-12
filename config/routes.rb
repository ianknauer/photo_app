Rails.application.routes.draw do
  root to: 'users#new'

  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'sessions#new'
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'

  resources :users, only: [:create, :show, :new]
  resources :sessions, only: [:create, :new, :destroy]
end
