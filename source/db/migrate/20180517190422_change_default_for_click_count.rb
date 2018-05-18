class ChangeDefaultForClickCount < ActiveRecord::Migration
  def change
    change_column :urls, :click_count, :integer, :default => 0
  end
end
