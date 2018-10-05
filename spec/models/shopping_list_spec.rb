require 'rails_helper'

RSpec.describe ShoppingList, type: :model do
  it 'is valid with a name' do
    expect(FactoryBot.build(:shopping_list)).to be_valid
  end

  it 'is invalid without a name' do
    shopping_list = FactoryBot.build(:shopping_list, name: nil)

    expect(shopping_list).to_not be_valid
    expect(shopping_list.errors[:name]).to include('is too short (minimum is 5 characters)')
  end
end
