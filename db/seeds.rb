# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item_categories = [
  'Fruit and Veg',
  'Butchery',
  'Dairy & Eggs',
  'Wine',
  'Beer and Cider',
  'Bakery',
  'Baking Supplies',
  'Sanitary',
  'Breakfast Cereals',
  'Canned Foods',
  'Cleaning Products',
  'Cold Drinks',
  'Condiments',
  'Confectionary',
  'Deli',
  'Desserts',
  'Frozen Foods',
  'Health',
  'Hot Drinks',
  'Household',
  'Jams, Honey and Spreads',
  'Laundry',
  'Snack Foods',
  'Stationary',
  'Misc'
]

item_categories.each do |category|
  Category.create(name: category)
end

ShoppingList.create(name: 'lunch', primary: true)
ShoppingList.create(name: 'grocery')
ShoppingList.create(name: 'books')
