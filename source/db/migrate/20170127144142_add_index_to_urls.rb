class AddIndexToUrls < ActiveRecord::Migration
  def change
    add_index :urls, :full, unique: true
    add_index :urls, :short, unique: true
  end
end
