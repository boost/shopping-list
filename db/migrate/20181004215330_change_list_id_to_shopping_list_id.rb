class ChangeListIdToShoppingListId < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :list_id, :shopping_list_id
  end
end
