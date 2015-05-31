class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :orig
      t.string :short
      t.integer :counter

      t.timestamps
    end
  end
end
