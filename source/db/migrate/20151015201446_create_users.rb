class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :login
      t.string :password
      t.boolean :active

      t.timestamps
    end
  end
end
