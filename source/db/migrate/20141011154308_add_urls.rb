class AddUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.string :shortened_url
      t.string :user
      t.integer :count

      t.timestamps
    end
  end
end
