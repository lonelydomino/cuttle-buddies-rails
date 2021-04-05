class FriendsController < ApplicationController
    def index
        @friends = current_user.friends
    end
    def create
        request = Request.find_by_id(params[:id])
        request.update(confirmed: true)
        redirect_to requests_path, success: "Friend added!"
    end
    def destroy
    end
end
