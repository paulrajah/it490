class Aircrew < ActiveRecord::Base
	belongs_to :pilot
	belongs_to :navigator

end
