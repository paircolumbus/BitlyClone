class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :unshortened
      t.string :shortened

      t.timestamps
    end
  end
end
