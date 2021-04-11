class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :author_id
      t.integer :recipient_id
      t.text :content
      t.string :subject
      t.timestamps
    end
  end
end
