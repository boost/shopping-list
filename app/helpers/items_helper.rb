module ItemsHelper
  def list_item_class(item)
    checked = item.checked ? ' checked' : ''

    'row' + checked
  end

  def category_name(item)
    item.category ? item.category.name : 'unknown'
  end
end
