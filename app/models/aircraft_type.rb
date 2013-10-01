class AircraftType < ActiveRecord::Base
	validates :code, presence: true
	validates :name, presence: true

	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
		else
			scoped
		end
	end
end
