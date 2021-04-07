class CreateFishQuantities < ActiveRecord::Migration[6.1]
  def change
    create_table :fish_quantities do |t|
      t.integer :fish_id
      t.integer :user_id
      t.integer :num
      t.timestamps
    end
  end
end
