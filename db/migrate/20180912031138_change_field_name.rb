class ChangeFieldName < ActiveRecord::Migration[5.2]
  def up
    rename_column :items, :category, :category_id
  end

  def down
    rename_column :items, :category_id, :category
  end
end
