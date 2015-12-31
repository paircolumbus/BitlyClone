class AddNameToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :name, :text
  end
end
