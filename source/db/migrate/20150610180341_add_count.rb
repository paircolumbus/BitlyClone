class AddCount < ActiveRecord::Migration
  def change
    change_table :urls do |t|
      t.integer :click_count, :default => 0
    end
  end
end
