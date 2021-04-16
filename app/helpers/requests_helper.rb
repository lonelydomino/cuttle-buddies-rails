module RequestsHelper

   def find_request_sender(r)
        User.find_by_id(r.user_id)
    end


    def already_friends?(id)
        user = User.find_by_id(id)
        if current_user.friends.include?(user)
            return true
        end
        return false
    end
end
