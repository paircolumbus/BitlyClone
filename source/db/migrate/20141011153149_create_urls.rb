class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long_name
      t.string :short_name
      t.string :hit_count
      
      t.timestamps
    end
  end
end
