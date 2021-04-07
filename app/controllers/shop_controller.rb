class ShopController < ApplicationController
    def index
        @fish = Fish.all
    end
end
