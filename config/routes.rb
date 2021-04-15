Rails.application.routes.draw do
 
  root 'pages#home'
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/about', to: 'pages#about'
  get 'signup', to: 'users#new'
  post 'signup', to:'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
  resources :users, only:[:show] do 
    resources :fishes, only:[:index, :destroy, :show, :edit, :update]
  end
  resources :users, only:[:show] do
    resources :messages, only:[:index, :new,   :destroy, :create]
  end

  resources :requests, only:[:create, :index, :destroy]
  resources :friends, only:[:create, :index, :destroy]
  resources :lottery, only:[:create, :index]

end
