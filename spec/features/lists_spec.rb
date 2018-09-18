require 'rails_helper'
require_relative 'helpers'

RSpec.configure do |c|
  c.include FeatureHelpers
end

RSpec.feature 'Lists', type: :feature do
  let(:valid_name) { 'Brand-new name' }
  let(:invalid_name) { 'Ok' }

  describe 'creating a list' do
    before do
      visit root_path
    end

    scenario 'user creates a new list' do
      name = 'Best list ever'

      fill_in 'Name', with: name
      click_button 'Create new list'

      expect(page).to have_content name
      expect(page).to have_content 'No items have yet been added'
    end
  end

  describe 'deleting a list' do
    before do
      @list = FactoryBot.create(:list)
      visit root_path
    end

    scenario 'user deletes a list' do
      shopping_list = find('li', text: @list.name)
      delete_link = shopping_list.find('.delete-list').click

      expect(page).to_not have_content @list.name
    end
  end

  describe "updating a list's name" do
    before do
      @list = FactoryBot.create(:list)
      visit list_path(@list.id)
    end

    context "from that list's page" do
      scenario "user updates the lists's name to something valid", js: true do
        update_list_name(valid_name)

        expect(page).to have_content valid_name
      end

      scenario "user edits a lists's name to something invalid", js: true do
        update_list_name(invalid_name)

        expect(page).to_not have_content invalid_name
        expect(page).to have_content 'Name is too short (minimum is 5 characters)'
        expect(page).to have_content @list.name
      end
    end

    context 'from the list index page' do
      scenario 'user updates the list name to something valid' do
        update_list_name(valid_name)

        expect(page).to have_content valid_name
        expect(page).to_not have_content @list.name
      end

      scenario "user edits a lists's name to something invalid", js: true do
        update_list_name(invalid_name)

        expect(page).to_not have_content invalid_name
        expect(page).to have_content @list.name
      end
    end
  end
end
