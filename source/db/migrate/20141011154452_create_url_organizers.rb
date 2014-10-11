class CreateUrlOrganizers < ActiveRecord::Migration
  def change
    create_table :url_organizers do |t|
      t.string :long_name
      t.string :short_name

      t.timestamps
    end
  end
end
