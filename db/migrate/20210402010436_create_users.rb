class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :birthday
      t.string :gender
      t.integer :age
      t.string :password_digest
      t.string :uid
      t.string :provider
      t.text :bio

      t.references :friendslist, foreign_key: {to_table: :users}
      t.references :partnerslist, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
