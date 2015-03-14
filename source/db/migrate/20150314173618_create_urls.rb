class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.string :short_url
      t.integer :click_count
    end
  end
end
