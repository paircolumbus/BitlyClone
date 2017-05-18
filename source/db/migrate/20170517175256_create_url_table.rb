class CreateUrlTable < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :long_url, null: false
      t.string :short_url, null: false
      t.integer :click_count, default: 0
      t.timestamps
    end
  end
end
