require 'rails_helper'
require_relative 'helpers'

RSpec.configure do |c|
  c.include FeatureHelpers
end

RSpec.feature 'Lists', type: :feature do
  let(:list_name) { 'My awesome list' }
  let(:another_list_name) { 'Another great list' }

  before do
    visit root_path
  end

  describe 'creating a list' do
    scenario 'user creates a new list' do
      create_list(list_name)

      expect(page).to have_content list_name
      expect(page).to have_content 'No items have yet been added'
    end
  end

  describe 'deleting a list' do
    before do
      create_list(another_list_name)
      visit root_path
    end

    scenario 'user deletes a list' do
      list = find('li', text: another_list_name)
      delete_link = list.find('.delete-list').click

      expect(page).to_not have_content another_list_name
    end
  end

  describe 'updating a list name from the list page (= show)' do
    before do
      create_list(list_name)
    end

    let(:valid_name) { 'Brand-new name' }
    let(:invalid_name) { 'Ok' }

    scenario "user edits a lists's name to something valid", js: true do
      find('.js-edit-list-title').click
      title_form = find('.js-list-title-form')
      title_form.fill_in 'list[name]', with: valid_name
      find('.js-submit-form').click

      expect(page).to have_content valid_name
    end

    scenario "user edits a lists's name to something invalid", js: true do
      find('.js-edit-list-title').click
      title_form = find('.js-list-title-form')
      title_form.fill_in 'list[name]', with: invalid_name
      find('.js-submit-form').click

      expect(page).to_not have_content invalid_name
      expect(page).to have_content 'Name is too short (minimum is 5 characters)'
      expect(page).to have_content list_name
    end
  end
end
