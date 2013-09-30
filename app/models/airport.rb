class Airport < ActiveRecord::Base
	validates :code, presence: true, length: { is: 3}, uniqueness: true
	validates :name, presence: true

	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
		else
			scoped
		end
	end
end
