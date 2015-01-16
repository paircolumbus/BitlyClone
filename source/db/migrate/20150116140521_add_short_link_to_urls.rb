class AddShortLinkToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :short_link, :string
  end
end
