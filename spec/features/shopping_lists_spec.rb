require 'rails_helper'
require_relative 'helpers'

RSpec.configure do |c|
  c.include FeatureHelpers
end

RSpec.feature 'Shopping Lists', type: :feature do
  let(:valid_name) { 'Brand-new name' }
  let(:invalid_name) { 'Ok' }

  describe 'creating a shopping list' do
    before do
      visit root_path
    end

    scenario 'user creates a new shopping list' do
      name = 'Best list ever'

      fill_in 'Name', with: name
      click_button 'Create new shopping list'

      expect(page).to have_content name.downcase
      expect(page).to have_content 'No items have yet been added'
    end
  end

  describe 'deleting a list' do
    before do
      @shopping_list = FactoryBot.create(:shopping_list)
      visit root_path
    end

    scenario 'user deletes a list' do
      shopping_list = find('li', text: @shopping_list.name.downcase)
      delete_link = shopping_list.find('.delete-list').click

      expect(page).to_not have_content @shopping_list.name
    end
  end

  describe "updating a list's name" do
    before do
      @shopping_list = FactoryBot.create(:shopping_list)
      visit shopping_list_path(@shopping_list.id)
    end

    context "from that list's page" do
      scenario "user updates the lists's name to something valid", js: true do
        update_shopping_list_name(valid_name)

        expect(page).to have_content valid_name.downcase
      end

      scenario "user edits a lists's name to something invalid", js: true do
        update_shopping_list_name(invalid_name)

        expect(page).to_not have_content invalid_name
        expect(page).to have_content 'Name is too short (minimum is 5 characters)'
        expect(page).to have_content @shopping_list.name
      end
    end

    context 'from the list index page' do
      scenario 'user updates the list name to something valid' do
        update_shopping_list_name(valid_name)

        expect(page).to have_content valid_name.downcase
        expect(page).to_not have_content @shopping_list.name
      end

      scenario "user edits a lists's name to something invalid", js: true do
        update_shopping_list_name(invalid_name)

        expect(page).to_not have_content invalid_name
        expect(page).to have_content @shopping_list.name
      end
    end
  end
end
