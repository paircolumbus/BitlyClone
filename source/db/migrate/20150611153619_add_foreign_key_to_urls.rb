class AddForeignKeyToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :user_id, :foreign_key
  end
end
