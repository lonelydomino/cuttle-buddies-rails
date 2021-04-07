class LotteryController < ApplicationController
    def index
        @fish = Fish.all
    end
    def create
        if current_user.points >= 25
            prize = Fish.order(Arel.sql('RANDOM()')).first
            points = current_user.points - 25
            current_user.update(points: points)
            current_user.fishes << prize
            redirect_to lottery_index_path(current_user), success: "You got: #{prize.name}!"
        else
            redirect_to lottery_index_path(current_user), error: "You don't have enough points!"
        end
    end
end
