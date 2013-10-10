class CreateShipmentRequests < ActiveRecord::Migration
  def change
    create_table :shipment_requests do |t|
      t.integer :user_id
      t.integer :origin_id
      t.integer :destination_id
      t.datetime :desired_departure_datetime
      t.integer :cargo_weight
      t.string :cargo_contents
      t.boolean :is_accepted, default: false
      t.timestamps
    end
  end
end
