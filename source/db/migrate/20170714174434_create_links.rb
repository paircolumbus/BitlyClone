class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :old_url
      t.string :new_url

      t.timestamps
    end
  end
end
