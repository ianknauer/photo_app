Rails.application.routes.draw do
  root to: 'customers#index'

  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'sessions#new'
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
  patch '/customers/:id', to: 'customers#update'

  resources :users, only: [:create, :show, :new]
  resources :sessions, only: [:create, :new, :destroy, :show]

  resources :customers, only: [:create, :new, :show, :index, :edit] do
    collection do
      post :search, to: "customers#search"
    end
    resources :albums, only: [:new, :show, :create, :index]
  end
  resources :pictures, only: [:create, :new, :show, :index]
end
