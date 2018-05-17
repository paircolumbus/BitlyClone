class Urls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long_url
      t.string :short_url
    end
  end
end
