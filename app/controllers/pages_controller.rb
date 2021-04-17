class PagesController < ApplicationController


  def home
  end
  
  def about
  end

  def most_fish
    array = Fish.user_with_most_fish.sort_by {|k, v| v}.last
    @user = User.find_by_id(array[0])
    @number_of_fish = array[1]
  end
  
end
