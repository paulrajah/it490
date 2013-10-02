class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :number
      t.integer :aircraft_id
      t.integer :origin_id
      t.integer :destination_id
      t.date :departure_time
      t.date :arrival_time
      t.integer :cargo_id
      t.integer :aircrew_id

      t.timestamps
    end
    add_index :flights, :number
  end
end
