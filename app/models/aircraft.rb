class Aircraft < ActiveRecord::Base
	validates :tail_number, presence: true
	validates :fuel_amount, presence: true

	belongs_to :aircraft_type

	def self.search(search)
		if search
			where('LOWER(tail_number) LIKE LOWER(?)', "%#{search}%")
		else
			scoped
		end
	end
end