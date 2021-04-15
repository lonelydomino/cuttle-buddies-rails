class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_many :requests
    has_many :user_fishes
    has_many :fishes, through: :user_fishes

    validates :email, uniqueness: true, presence: true
    validates :username, uniqueness: true, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true


    scope :search_by_name, -> (search) {where("username LIKE ?", "#{search}%")}

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
            u.first_name = auth['info']['first_name']
            u.last_name = auth['info']['last_name']
            u.password = SecureRandom.hex(20)
            u.username = auth['info']['name'].downcase.gsub(" ", "_")
        end
    end
end
