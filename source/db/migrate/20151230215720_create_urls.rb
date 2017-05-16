class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :unshortened
      t.text :shortened
      t.belongs_to :user

      t.timestamps
    end
  end
end
