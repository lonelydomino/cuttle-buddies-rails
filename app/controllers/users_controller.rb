class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
    before_action :redirect_if_not_logged_in, only: [:show]
    rescue_from ActiveRecord::RecordNotFound, with: :deny_access
    rescue_from AbstractController::ActionNotFound, with: :deny_access
    rescue_from ActionController::RoutingError, with: :deny_access

    def index
        if params["search"]
            @users = User.search_by_name(params["search"])
        else
            @users = User.all
        end
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(signup_params)
        if @user.id
            session[:user_id] = @user.id
            redirect_to @user, success: "Account created!"
        else
            redirect_to '/signup', error: "Failed to register!"
        end
    end

    def show
        @user = current_user
        @fishes = @user.user_fishes.collect {|a| find_fish(a.fish_id) }
    end

    def edit
        @user = current_user
    end

    def update
        if current_user.update(signup_params)
            redirect_to user_path, success: "Updated!"
        else
            redirect_to user_edit_path(current_user)
        end
    end

    private

    def current_user        
        @user = User.find_by_id(session[:user_id])
    end

    def signup_params
        params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :avatar)
    end

    def find_fish(id)
        Fish.find_by_id(id)
    end
end
    