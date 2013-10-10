class Aircrew < ActiveRecord::Base
	belongs_to :pilot
	belongs_to :navigator

	def pretty_name
		self.pilot.lname + ", " + self.pilot.fname + " - " + self.navigator.lname + ", " + self.navigator.fname 
	end 
end
