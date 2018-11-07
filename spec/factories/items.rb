FactoryBot.define do
  factory :item do
    name { 'An item' }
    quantity { 2 }

    association :shopping_list
  end
end
