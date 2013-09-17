class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :number
      t.string :origin, limit: 3
      t.string :destination, limit: 3
      t.date :departure_time
      t.date :arrival_time
      t.integer :cargo_id
      t.integer :crew_id

      t.timestamps
    end
    add_index :flights, :number, unique: true
  end
end
