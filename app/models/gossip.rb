class Gossip < ApplicationRecord
	has_many :types
	has_many :tags, through: :types
	has_many :comments
	has_one :like
	belongs_to :user
end
