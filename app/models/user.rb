class User < ApplicationRecord
    has_secure_password
    has_one_attached :image
    validates :email, uniqueness: true
    scope :search_by_name, -> (search) {where("username LIKE ?", "#{search}%")}

    has_many :requests
    has_many :pending_requests, -> {where confirmed: false }, class_name: 'Request', foreign_key: 'friend_id'
    
    has_many :user_fishes
    has_many :fishes, through: :user_fishes
    def friends
        friends_i_sent_requests = Request.where(user_id: id, confirmed: true).pluck(:friend_id)
        friends_i_got_requests = Request.where(friend_id: id, confirmed: true).pluck(:user_id)
        ids = friends_i_sent_requests + friends_i_got_requests
        User.where(id: ids)
    end

    def send_request_to(new_friend)
        Request.find_or_create_by(user_id: self.id, friend_id: new_friend.id)
    end
   
    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(20)
            u.username = auth['info']['name'].downcase.gsub(" ", "_")
        end
    end
end
