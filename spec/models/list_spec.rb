require 'rails_helper'

RSpec.describe List, type: :model do
  it 'is valid with a name' do
    expect(FactoryBot.build(:list)).to be_valid
  end

  it 'is invalid without a name' do
    list = FactoryBot.build(:list, name: nil)

    expect(list).to_not be_valid
    expect(list.errors[:name]).to include('is too short (minimum is 5 characters)')
  end
end
