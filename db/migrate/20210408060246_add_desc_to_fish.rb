class AddDescToFish < ActiveRecord::Migration[6.1]
  def change
    add_column :fish, :desc, :text
  end
end
