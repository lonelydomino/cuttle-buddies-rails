class PagesController < ApplicationController
  before_action :redirect_back, only: [:most_fish]

  def home
  end
  
  def about
  end

  def most_fish
    array = Fish.user_with_most_fish.first
    @user = User.find_by_id(array[0])
    @number_of_fish = array[1]
  end
  
  private

  def redirect_to_back
    session[:return_to] ||= request.referer
  end
end
