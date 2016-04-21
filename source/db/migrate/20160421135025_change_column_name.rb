class ChangeColumnName < ActiveRecord::Migration
  def up
    rename_column :users, :hash, :password_hash
  end

  def down
    rename_column :users, :password_hash, :hash
  end
end
