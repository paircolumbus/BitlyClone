class RemoveShortcodeFromUrls < ActiveRecord::Migration
  def change
    remove_column :urls, :shortcode, :string
  end
end
