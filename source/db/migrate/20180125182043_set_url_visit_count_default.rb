class SetUrlVisitCountDefault < ActiveRecord::Migration
  def change
    change_column :urls, :visit_count, :integer, default: 0
  end
end
