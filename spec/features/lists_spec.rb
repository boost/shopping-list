require 'rails_helper'

RSpec.feature 'Lists', type: :feature do
  let(:list_name) { 'My list' }
  let(:another_list_name) { 'Another list' }

  describe 'list creation' do
    before do
      visit root_path
    end

    scenario 'user creates a new list with a name' do
      fill_in 'Name', with: list_name
      click_button 'Create new list'

      expect(page).to have_content list_name
      expect(page).to have_content 'No items have yet been added'
    end

    scenario 'user creates a new list without a name' do
      click_button 'Create new list'

      expect(page).to have_content 'List created at'
      expect(page).to have_content 'No items have yet been added'
    end
  end

  describe 'list deletion' do
    before do
      visit root_path
      fill_in 'Name', with: another_list_name
      click_button 'Create new list'

      visit root_path
    end

    scenario 'user deletes a list' do
      list = find('li', text: another_list_name)
      delete_link = list.all('a').last.click # TODO: fragile

      expect(page).to_not have_content another_list_name
    end
  end
end
