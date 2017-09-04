class Gender < ApplicationRecord
	has_many :users
	def to_s
		self.gender
	end
end
