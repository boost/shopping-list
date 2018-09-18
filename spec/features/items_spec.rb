require 'rails_helper'

RSpec.feature 'Items', type: :feature do
  let(:quantity) { 2 }

  before(:each) do
    @item = FactoryBot.create(:item, quantity: quantity)
    visit list_path(@item.list_id)
  end

  describe 'adding an item' do
    let(:name) { 'Bunch of bananas' }

    scenario 'user adds an item' do
      fill_in 'Name', with: name
      click_button 'Add item'

      expect(page).to have_content name
    end
  end

  describe 'incrementing the quantity of an item', js: true do
    it 'increases by 1' do
      item_to_increment = find('li', text: @item.name)
      item_to_increment.find('.increment-quantity').click

      expect(item_to_increment).to have_content (quantity + 1)
    end
  end

  describe 'decrementing the quantity of an item', js: true do
    context 'when the item quantity is > 1' do
      it 'decrements by 1' do
        item_to_decrement = find('li', text: @item.name)
        item_to_decrement.find('.decrement-quantity').click

        expect(item_to_decrement).to have_content (quantity - 1)
      end
    end

    context 'when the item quantity is 1' do
      let(:name) { 'Canteloupe' }

      before do
        @canteloupe = FactoryBot.create(:item, quantity: 1, name: name)
        visit list_path(@canteloupe.list_id)
      end

      it 'is deleted' do
        item_to_decrement = find('li', text: @canteloupe.name)
        item_to_decrement.find('.decrement-quantity').click

        expect(page).to_not have_content name
        expect(page).to have_content 'No items have yet been added.'
      end
    end
  end

  describe 'deleting an item' do
    scenario 'user deletes an item' do
      item_to_delete = find('li', text: @item.name)
      item_to_delete.find('.delete-item').click

      expect(page).to_not have_content @item.name
    end
  end
end
