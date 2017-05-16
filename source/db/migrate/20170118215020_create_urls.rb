class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :address
      t.string :bitly_clone

      t.timestamps
    end
  end
end
