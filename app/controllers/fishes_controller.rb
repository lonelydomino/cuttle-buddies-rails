class FishesController < ApplicationController
  def index
    @fish = current_user.fishes
  end

  def destroy
  end
end
