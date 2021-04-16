class FishesController < ApplicationController
  
  def index
    @userfish = UserFish.where("user_id = ?", current_user.id)
  end

  def destroy
    UserFish.find_by_id(params[:uf_id]).destroy
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
