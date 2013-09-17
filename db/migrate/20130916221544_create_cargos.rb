class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.integer :weight
      t.string :contents

      t.timestamps
    end
  end
end
