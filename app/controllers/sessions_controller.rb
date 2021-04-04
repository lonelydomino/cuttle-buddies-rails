class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
    
    def home
    end
    
    def new
        @user = User.new
        byebug
    end

    def create
        user = User.find_by_email(params[:user][:email])
        byebug
        if user && user.authenticate(params[:user][:password])
            byebug
            session[:user_id] = user.id
            redirect_to user
        else
            byebug
            redirect_to '/login', error: "Invalid credentials"
        end
    end
    
    def omniauth
        @user = User.from_omniauth(auth)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to @user
        else

        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    def auth
        request.env['omniauth.auth']
    end

    

  end
