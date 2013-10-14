class Flight < ActiveRecord::Base
	belongs_to :aircraft
	belongs_to :origin, :class_name => "Airport"
	belongs_to :destination, :class_name => "Airport"
	belongs_to :cargo
	belongs_to :aircrew
	belongs_to :user

	validates :aircraft, presence: true
	validates :origin, presence: true
	validates :destination, presence: true
	validates :cargo, presence: true
	validates :aircrew, presence: true
	validates :number, presence: true

	def self.search(search)
		if search
			where('LOWER(number) LIKE LOWER(?)', "%#{search}%")
		else
			scoped
		end
	end
end
