class CreateAircrews < ActiveRecord::Migration
  def change
    create_table :aircrews do |t|
      t.integer :pilot_id
      t.integer :navigator_id

      t.timestamps
    end
  end
end
