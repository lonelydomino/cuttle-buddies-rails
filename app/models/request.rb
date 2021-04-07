class Request < ApplicationRecord
    belongs_to :user
    scope :find_requestee_by_id, -> (friend_id) {where("friend_id = ?", "#{friend_id}")}
    scope :pending, -> {where("confirmed = false")}
    
    def confirm_request
        self.update(confirmed: true)
    end

    def deny_or_delete_request
        self.destroy
    end

end
