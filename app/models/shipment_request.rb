class ShipmentRequest < ActiveRecord::Base
	belongs_to :user
	belongs_to :origin, :class_name => "Airport"
	belongs_to :destination, :class_name => "Airport"

	validates :origin_id, :presence => true, :numericality => true
	validates :destination_id, :presence => true, :numericality => true
	validates :desired_departure_datetime, :presence => true
	validates :cargo_weight, :presence => true, :numericality => true
	validates :cargo_contents, :presence => true
end