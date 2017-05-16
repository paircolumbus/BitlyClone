class AddShortPathToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :short_path, :string
  end
end
