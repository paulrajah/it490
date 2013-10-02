class AircraftType < ActiveRecord::Base
	validates :code, presence: true
	validates :name, presence: true

	def self.search(search)
		if search
			where('LOWER(name) LIKE LOWER(?)', "%#{search}%")
		else
			scoped
		end
	end
end
