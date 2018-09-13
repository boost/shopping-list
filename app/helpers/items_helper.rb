module ItemsHelper
  def list_item_class(item)
    checked = item.checked ? ' checked' : ''

    'row' + checked
  end

  def category_name(item)
    item.category ? item.category.name : 'unknown'
  end

  def category_emoji(item)
    emojis =
      {
        'Fruit and Veg' => '🍏',
        'Butchery' => '🥓',
        'Dairy & Eggs' => '🥚',
        'Wine' => '🍷',
        'Beer and Cider' => '🍺',
        'Bakery' => '🍞',
        'Baking Supplies' => '🍞',
        'Sanitary' => '♀️',
        'Breakfast Cereals' => '🥣',
        'Canned Foods' => '🥫',
        'Cleaning Products' => '✨',
        'Cold Drinks' => '🥤',
        'Condiments' => '🥫',
        'Confectionary' => '🍬',
        'Deli' => '🥗',
        'Desserts' => '🍰',
        'Frozen Foods' => '❄️',
        'Health' => '⚕️',
        'Hot Drinks' => '☕',
        'Household' => '🏠',
        'Jams, Honey and Spreads' => '🍯',
        'Laundry' => '👚',
        'Snack Foods' => '🥨',
        'Stationary' => '📝',
        'Misc' => '❔'
      }

    item.category ? emojis[item.category.name] : '❔'
  end
end
