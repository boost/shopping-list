module FeatureHelpers
  def update_list_name(name)
    find('.js-edit-list-title').click
    title_form = find('.js-list-title-form')
    title_form.fill_in 'list[name]', with: name
    find('.js-submit-form').click
  end
end
