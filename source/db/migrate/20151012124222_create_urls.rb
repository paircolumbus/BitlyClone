class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :linkid, limit: 8
      t.string :target_link, limit: 1024

      t.timestamps
    end
    add_index :urls, :linkid, unique: true
  end
end
