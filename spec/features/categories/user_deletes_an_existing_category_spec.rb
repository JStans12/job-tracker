require 'rails_helper'

describe 'user deletes an existing category' do
  scenario 'that category no longer shows up in the categories index' do
    category = create(:category)

    visit categories_path
    within(:css, ".category_#{category.id}") do
      click_on 'Delete'
    end

    expect(page).to have_current_path(categories_path)
    expect(page).to_not have_content(category.title)
  end
end
