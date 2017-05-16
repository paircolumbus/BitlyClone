class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls, id: false, primary_key: 'id' do |t|
      t.column :id, :string, :limit => 255 
      t.column :address, :string, :unique => true
      t.timestamps null: false
    end
  end
end
