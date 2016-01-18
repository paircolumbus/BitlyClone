class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :long
      t.string :short
      t.integer :click_count, default: 0
    end
  end
end
