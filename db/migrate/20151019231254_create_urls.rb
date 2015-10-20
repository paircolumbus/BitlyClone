class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :longText
      t.belongs_to :user

      t.timestamps null: false
    end
    add_index :urls, :longText, unique: true
  end
end
