class AddUserInfoToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ordered_by, :string
    add_column :items, :ordered_for, :string
  end
end
