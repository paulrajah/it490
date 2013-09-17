class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :tail_number, limit: 6
      t.integer :aircraft_type_id
      t.integer :fuel_amount

      t.timestamps
    end
    add_index :aircrafts, :tail_number, unique: true
  end
end
