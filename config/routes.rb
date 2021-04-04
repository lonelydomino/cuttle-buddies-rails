Rails.application.routes.draw do
  #get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/about', to: 'pages#about'
  get 'signup', to: 'users#new'
  post 'signup', to:'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  post "/friends/accept_request" => "friends#accept_request"


  resources :users

  resources :users, only: [:show] do
    resources :messages, only:[:show, :index, :new, :edit]
  end
  resources :friends

end
