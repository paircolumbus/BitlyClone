class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long_url
      t.string :short_key, limit: 10

      t.timestamps
    end
  end
end
