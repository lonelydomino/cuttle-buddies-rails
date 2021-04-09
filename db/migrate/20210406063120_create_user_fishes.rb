class CreateUserFishes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_fishes do |t|
      t.integer :fish_id
      t.integer :user_id
      t.string :custom_name
      t.timestamps
    end
  end
end
