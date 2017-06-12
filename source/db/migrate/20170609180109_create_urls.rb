class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :shortened
      t.string :original
      t.integer :click_count

      t.timestamps
    end
  end
end
