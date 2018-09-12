module ItemsHelper
  def item_class(item)
    if item.checked
      'item-data checked'
    else
      'item-data'
    end
  end
end
