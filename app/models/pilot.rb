class Pilot < ActiveRecord::Base
	validates :fname, presence: true
	validates :lname, presence: true

	def self.search(search)
		if search
			where('LOWER(fname) LIKE LOWER(?) or LOWER(lname) LIKE LOWER(?)', "%#{search}%", "%#{search}%")
		else
			scoped
		end
	end
end
