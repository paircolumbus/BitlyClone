class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|

      t.timestamps
    end
  end
end
