class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :source
      t.text :destination

      t.timestamps
    end
  end
end
