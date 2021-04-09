class FishesController < ApplicationController
  def index
    @userfish = UserFish.where("user_id = ?", current_user.id)
  end

  def destroy
  
    UserFish.find_by_id(params[:uf_id]).destroy
   # Fish.find_by_id(params[:id]).user_fishes.where("fish_id = #{params[:id]}").first.destroy
    #OPTIMIZE figure out how to get this to show specific fish quantity
    
    redirect_to user_fishes_url
  end
end
