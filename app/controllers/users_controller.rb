class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(signup_params)
        if @user.id
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = current_user
    end

    private

    def current_user
        @user = User.find_by_id(session[:user_id])
    end

    def signup_params
        params.require(:user).permit(:username, :email, :first_name, :last_name, :birthday, :gender, :age, :password)
    end
end
