class CreateUrLindices < ActiveRecord::Migration
  def change
    create_table :ur_lindices do |t|
      
      add_index :urls, unique: true

    end
  end
end
