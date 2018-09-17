class MakeNameNotNullable < ActiveRecord::Migration[5.2]
  def up
    change_column :lists, :name, :string, null: false
  end

  def down
    change_column :lists, :name, :string, null: true
  end
end
