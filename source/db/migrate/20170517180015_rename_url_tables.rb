class RenameUrlTables < ActiveRecord::Migration
  def self.up
    rename_table :url_tables, :urls
  end

  def self.down
    rename_table :urls, :url_tables
  end
end
