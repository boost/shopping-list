class ItemFieldsNotNullable < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :name, :string, null: false
    change_column :items, :quantity, :integer, null: false
    change_column :items, :checked, :boolean, default: false, null: false
  end

  def down
    change_column :items, :name, :string, null: true
    change_column :items, :quantity, :integer, null: true
    change_column :items, :checked, :boolean, null: true
  end
end
