class Fish < ApplicationRecord
    has_many :fish_quantities
    has_many :users, through: :fish_quantities
    #has_one_attached :image
end
