class AddOriginalUrlToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :original_url, :string
  end
end
