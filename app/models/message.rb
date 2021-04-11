class Message < ApplicationRecord
    validates :subject, presence: true
    validates :content, presence: true
end
