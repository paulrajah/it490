class Aircraft < ActiveRecord::Base
	validates :tail_number, presence: true
	validates :fuel_amount, presence: true

	belongs_to :aircraft_type

	def self.search(search)
		if search
			joins(:aircraft_type).where('LOWER(tail_number) LIKE LOWER(?) or LOWER(aircraft_types.name) LIKE LOWER(?)', "%#{search}%", "%#{search}%")
		else
			scoped
		end
	end

	def pretty_name
		self.tail_number + " - " + self.aircraft_type.name
	end 
end