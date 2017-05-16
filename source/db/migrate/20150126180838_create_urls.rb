class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :shortcode
      t.string :destination

      t.timestamps
    end
  end
end
