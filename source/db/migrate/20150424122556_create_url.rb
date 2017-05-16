class CreateUrl < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original_url, null: false
      t.integer :click_count, :default => 0
      t.string :short_url
      t.string :short_extension
    end

    add_index :urls, :original_url
    add_index :urls, :short_url, :unique => true
    add_index :urls, :short_extension, :unique => true
  end
end
