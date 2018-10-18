# frozen_string_literal: true

module ItemsHelper
  def shopping_list_item_class(item)
    checked = item.checked ? ' checked' : ''

    'row' + checked
  end

  def category_name(item)
    item.category ? item.category.name : 'unknown'
  end
end
