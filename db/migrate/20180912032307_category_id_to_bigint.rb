class CategoryIdToBigint < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :category_id, :bigint
  end
end
