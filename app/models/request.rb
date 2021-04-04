class Request < ApplicationRecord
    belongs_to :user

    def confirm_request
        self.update(confirmed: true)
    end

    def deny_or_delete_request
        self.destroy
    end
end
