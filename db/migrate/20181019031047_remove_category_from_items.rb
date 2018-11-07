class RemoveCategoryFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :category_id, :bigint
  end
end
