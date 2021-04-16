class RequestsController < ApplicationController
  
    def index
        pending_requests = Request.where("friend_id = ? AND confirmed = false", current_user.id)
        @requests = pending_requests
    end

    def create
        receiver = User.find(params[:id])
        current_user.send_request_to(receiver)
        redirect_to users_path, success: "Request sent!"
    end

    def destroy
        request = Request.find_by_id(params[:id])
        request.destroy
        redirect_to requests_path
    end

    private

    def deny_access
        byebug
        render :"errors/record_not_found"
      end
end
