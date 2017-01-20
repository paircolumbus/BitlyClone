class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :address
      t.string :unique_key
      t.timestamps 
    end
  end
end
