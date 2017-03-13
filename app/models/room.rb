class Room < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :messages, dependent: :destroy, inverse_of: :room

  accepts_nested_attributes_for :messages
end
