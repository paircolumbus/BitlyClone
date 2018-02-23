class AddClickCountToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :click_count, :integer, :default => 0
  end
end
