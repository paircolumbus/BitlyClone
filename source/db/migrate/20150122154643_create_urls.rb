class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :value

      t.timestamps
    end
  end
end
