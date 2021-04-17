class Request < ApplicationRecord
    belongs_to :user
        
    scope :any_request_exists?, -> (friend_id) {where("friend_id = ? AND confirmed = false", "#{friend_id}")}
    
    def confirm_request
        self.update(confirmed: true)
    end

    def deny_or_delete_request
        self.destroy
    end

    def self.pending_request?(id1,id2)
        case1 = !Request.where(user_id: id1, friend_id:id2).empty?
        case2 = !Request.where(user_id: id2, friend_id:id1).empty?
        case1 || case2
    end

    def self.find_request_id(id1, id2)
        if Request.where(user_id: id1, friend_id: id2,confirmed: true).empty?
            Request.where(user_id: id2, friend_id: id1,confirmed: true)[0].id
        else
            Request.where(user_id: id1, friend_id: id2,confirmed: true)[0].id
        end
    end
    
    def self.find_request(request_id)
        Request.find_by_id(request_id)
    end


end
