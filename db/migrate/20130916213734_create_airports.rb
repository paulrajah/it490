class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :code, limit: 3
      t.string :name

      t.timestamps
    end
    add_index :airports, :code, unique: true
  end
end
