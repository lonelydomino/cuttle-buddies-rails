class FishesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :deny_access
    rescue_from AbstractController::ActionNotFound, with: :deny_access
    rescue_from ActionController::RoutingError, with: :deny_access
  
  def index
    @userfish = UserFish.where("user_id = ?", current_user.id)
  end

  def destroy
    UserFish.find_by_id(params[:uf_id]).destroy
    #OPTIMIZE figure out how to get this to show specific fish quantity
    redirect_to user_fishes_url
  end

  def edit
    @user_fish = UserFish.find_by_id(params[:uf_id])
  end
    
  def update
    fish = UserFish.find_by_id(params[:id])
    fish.update(custom_name: params[:user_fish][:name])
    redirect_to user_fishes_url
  end
end
