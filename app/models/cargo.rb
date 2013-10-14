class Cargo < ActiveRecord::Base
	has_one :flight

	validates :weight, presence: true
	validates :contents, presence: true

	def self.search(search)
		if search
			where('LOWER(id) LIKE LOWER(?)', "%#{search}%")
		else
			scoped
		end
	end
end
