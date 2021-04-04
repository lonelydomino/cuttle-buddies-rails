class User < ApplicationRecord
    has_secure_password
    belongs_to :friendslist, class_name: "User", optional: true
    has_many :friends, class_name: "User", foreign_key: "friendslist_id"
    belongs_to :partnerslist, class_name: "User", optional: true
    has_many :partners, class_name: "User", foreign_key: "partnerslist_id"
    scope :search_by_name, -> (search) {where("username LIKE ?", "#{search}%")}

    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(20)
            u.username = auth['info']['name'].downcase.gsub(" ", "_")
        end
    end
end
