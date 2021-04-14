class Fish < ApplicationRecord
    has_many :user_fishes
    has_many :users, through: :user_fishes
    #has_one_attached :image
    #TODO seed image data?

    scope :user_with_most_fish, -> { UserFish.group(:user_id).count(:fish_id)}

end
