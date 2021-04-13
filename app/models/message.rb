class Message < ApplicationRecord
    validates :subject, presence: true
    validates :content, presence: true
    validates :author_id, presence: true
end
