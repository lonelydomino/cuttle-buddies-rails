Rails.application.routes.draw do
  #get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'auth/:provider/callback', to: 'sessions#omniauth'

  get 'signup', to: 'users#new'
  post 'signup', to:'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
  resources :friends

end
