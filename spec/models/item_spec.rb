require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is valid with a name and quantity' do
    expect(FactoryBot.build(:item)).to be_valid
  end

  it 'is unchecked by default' do
    item = FactoryBot.build(:item)

    expect(item.checked).to be false
  end

  it 'is invalid without a name' do
    item = FactoryBot.build(:item, name: nil)

    expect(item).to_not be_valid
    expect(item.errors[:name]).to include('is too short (minimum is 3 characters)')
  end

  it 'is invalid without a quantity' do
    item = FactoryBot.build(:item, quantity: nil)

    expect(item).to_not be_valid
    expect(item.errors[:quantity]).to include('is not a number')
  end
end
