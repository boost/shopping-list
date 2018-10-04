class DefaultItemQuantityToOne < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :quantity, :integer, default: 1
  end
end
