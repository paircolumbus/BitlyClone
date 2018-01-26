class RenameVisitCountToClickCount < ActiveRecord::Migration
  def change
    rename_column :urls, :visit_count, :click_count
  end
end
