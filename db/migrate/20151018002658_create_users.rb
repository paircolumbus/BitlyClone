class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :admin

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
