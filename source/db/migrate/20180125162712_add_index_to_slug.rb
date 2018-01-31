class AddIndexToSlug < ActiveRecord::Migration
  def change
  	add_index :urls, :slug
  end
end
