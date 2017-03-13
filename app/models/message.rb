class Message < ApplicationRecord
  belongs_to :room
  validates :username, :body, presence: true
end
