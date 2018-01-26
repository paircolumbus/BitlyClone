class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :long_url
      t.text :short_url
      t.integer :visit_count
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
