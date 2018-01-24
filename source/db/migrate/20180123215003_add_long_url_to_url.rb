class AddLongUrlToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :long_url, :text
  end
end
