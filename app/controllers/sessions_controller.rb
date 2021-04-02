class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user
        else
            redirect_to '/login', error: "Invalid credentials"
        end
    end

    def destroy
        session.clear
        redirect_to '/login'
    end
end
