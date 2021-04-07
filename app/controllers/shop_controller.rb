class ShopController < ApplicationController
    def index
        @fish = Fish.all
    end
    def create
        prize = Fish.order(Arel.sql('RANDOM()')).first
        current_user.fishes << prize
        redirect_to user_path(current_user), success: "You got: #{prize.name}!"
    end
end
