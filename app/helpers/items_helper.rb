module ItemsHelper
  def list_item_class(item)
    if item.checked
      'item-data checked'
    else
      'item-data'
    end
  end

  def category_name(item)
    item.category ? item.category.name : 'unknown'
  end
end
