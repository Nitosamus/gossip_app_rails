class Tag < ApplicationRecord
	has_many :types
	has_many :gossips, through: :types
end
