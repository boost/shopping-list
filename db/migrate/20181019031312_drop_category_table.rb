class DropCategoryTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :categories do |t|
      t.string "name"
      t.timestamps null: false
    end
  end
end
