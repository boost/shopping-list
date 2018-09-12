class ItemCheckedDefault < ActiveRecord::Migration[5.2]
  def change
    Item.where(checked: nil).update_all(checked: false)
  end
end
