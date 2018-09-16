require 'rails_helper'

RSpec.describe List, type: :model do
  it 'is valid with a name' do
    expect(List.new(name: "Katherine's awesome list")).to be_valid
  end

  it 'is valid without a name' do
    expect(List.new).to be_valid
  end
end