class AddShortAndLongUrlsToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :short_url, :string
    rename_column :urls, :value, :long_url
  end
end
