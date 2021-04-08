Rails.application.routes.draw do
  get 'fish/index'
  get 'fish/destroy'
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

  # post "/requests/accept_request" => "requests#accept_request"


  resources :users
  resources :users, only:[:show] do 
    resources :fishes, only:[:index, :destroy, :show]
  end

  resources :requests, only:[:create, :index, :destroy]
  resources :friends, only:[:create, :index, :destroy]
  resources :lottery, only:[:create, :index]
  # resources :users, only: [:show] do
  #   resources :messages, only:[:show, :index, :new, :edit]
  # end
#TODO cleanup
#OPTIMIZE this
#FIXME this
end
