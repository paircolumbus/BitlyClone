class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :full_url
      t.string :short_url
      t.integer :click_counter
      t.integer :user_id

      t.timestamps
    end
  end
end
