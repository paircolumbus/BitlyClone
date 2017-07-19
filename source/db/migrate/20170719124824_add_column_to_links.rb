class AddColumnToLinks < ActiveRecord::Migration
  def change
    add_column :links, :counter, :integer, default: 0
  end
end
