class FishesController < ApplicationController
  def index
    @fish = current_user.fishes
  end

  def destroy
    Fish.find_by_id(params[:id]).fish_quantities.where("fish_id = #{params[:id]}").first.destroy
    #OPTIMIZE figure out how to get this to show specific fish quantity
    redirect_to user_fishes_url
  end
end
