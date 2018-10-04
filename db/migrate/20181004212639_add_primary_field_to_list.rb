class AddPrimaryFieldToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :primary, :boolean, default: false
  end
end
