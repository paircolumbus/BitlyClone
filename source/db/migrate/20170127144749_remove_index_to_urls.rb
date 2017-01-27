class RemoveIndexToUrls < ActiveRecord::Migration
  def change
    remove_index :urls, :full
  end
end
