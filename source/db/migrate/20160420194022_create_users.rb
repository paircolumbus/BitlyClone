class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.boolean :is_admin
      t.string :salt
      t.string :hash

      t.timestamps
    end
  end
end
