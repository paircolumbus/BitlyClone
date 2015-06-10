class CreateUrls < ActiveRecord::Migration
  def change
    drop_table :urls do |d|
    end
    create_table :urls do |t|
      t.string :address
      t.string :unique_key

      t.timestamps
    end
  end
end
