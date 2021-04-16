class Request < ApplicationRecord
    belongs_to :user
    
    def confirm_request
        self.update(confirmed: true)
    end

    def deny_or_delete_request
        self.destroy
    end

    def self.find_request(id1, id2)
        if Request.where(user_id: id1, friend_id: id2,confirmed: true).empty?
            Request.where(user_id: id2, friend_id: id1,confirmed: true)[0].id
        else
            Request.where(user_id: id1, friend_id: id2,confirmed: true)[0].id
        end
    end

end
