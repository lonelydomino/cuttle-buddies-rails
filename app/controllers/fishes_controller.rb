class FishesController < ApplicationController
  def index
    @fish = current_user.fishes
  end

  def destroy
    current_user.fishes.find_by_id(params[:id]).destroy
    redirect_to user_fishes_url
  end
end
