class AddIndexToUrls < ActiveRecord::Migration
  def change
    add_index :urls, :long_url
    add_index :urls, :short_key
  end
end
