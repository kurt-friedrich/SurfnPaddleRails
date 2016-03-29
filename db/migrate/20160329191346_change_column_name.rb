class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :avatar, :image
  end
end
