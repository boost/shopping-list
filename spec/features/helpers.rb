module FeatureHelpers
  def create_list(name)
    fill_in 'Name', with: name
    click_button 'Create new list'
  end
end
