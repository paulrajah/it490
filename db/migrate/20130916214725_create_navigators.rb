class CreateNavigators < ActiveRecord::Migration
  def change
    create_table :navigators do |t|
      t.string :fname
      t.string :lname

      t.timestamps
    end
  end
end
