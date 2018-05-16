class AddDefaultValueToClickCountForUrls < ActiveRecord::Migration
  def change
    change_column_default :urls, :click_count, 0
  end
end
