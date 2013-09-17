class CreatePilots < ActiveRecord::Migration
  def change
    create_table :pilots do |t|
      t.string :fname
      t.string :lname

      t.timestamps
    end
  end
end
