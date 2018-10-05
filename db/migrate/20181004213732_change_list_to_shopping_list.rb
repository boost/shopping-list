class ChangeListToShoppingList < ActiveRecord::Migration[5.2]
  def change
    rename_table :lists, :shopping_lists
  end
end
