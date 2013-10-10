class Airport < ActiveRecord::Base
	validates :code, presence: true, length: { is: 3}, uniqueness: true
	validates :name, presence: true

	def self.search(search)
		if search
			where('LOWER(name) LIKE LOWER(?) or LOWER(code) LIKE LOWER(?)', "%#{search}%", "%#{search}%")
		else
			scoped
		end
	end

	def pretty_name
		self.code + " - " + self.name
	end 
end
