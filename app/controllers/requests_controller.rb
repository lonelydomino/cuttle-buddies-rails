class RequestsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :deny_access
    rescue_from AbstractController::ActionNotFound, with: :deny_access
    rescue_from ActionController::RoutingError, with: :deny_access
  
  
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
