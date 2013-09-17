class CreateAircraftTypes < ActiveRecord::Migration
  def change
    create_table :aircraft_types do |t|
      t.string :code, limit: 4
      t.string :name

      t.timestamps
    end
    add_index :aircraft_types, :code, unique: true
  end
end
