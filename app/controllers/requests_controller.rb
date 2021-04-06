class RequestsController < ApplicationController
    def index
        @requests = current_user.pending_requests
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
end
