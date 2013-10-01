class Pilot < ActiveRecord::Base
	validates :fname, presence: true
	validates :lname, presence: true

	def self.search(search)
		if search
			where('fname LIKE ? or lname LIKE ?', "%#{search}%", "%#{search}%")
		else
			scoped
		end
	end
end
