class Cargo < ActiveRecord::Base
	has_one :flight


	def self.search(search)
		if search
			where('LOWER(id) LIKE LOWER(?)', "%#{search}%")
		else
			scoped
		end
	end
end
