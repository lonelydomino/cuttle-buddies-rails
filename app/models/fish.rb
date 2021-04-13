class Fish < ApplicationRecord
    has_many :user_fishes
    has_many :users, through: :user_fishes
    #has_one_attached :image
    #TODO seed image data?

    scope :user_with_most_fish, -> (friend_id) {where("friend_id = ?", "#{friend_id}")}

end
