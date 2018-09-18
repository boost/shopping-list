FactoryBot.define do
  factory :item do
    name { 'An item' }
    quantity { 2 }

    association :list
    association :category
  end
end
