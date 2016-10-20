require 'rails_helper'

describe "User edits a new category" do
  scenario "user can edit a new category" do
    category1, category2 = create_list(:category, 2)

    visit categories_path
    within(:css, ".category_#{category2.id}") do
      click_on "Edit"
    end
    fill_in "category[title]", with: "Crappy Jobs"
    click_on "Update"

    expect(page).to have_current_path("/categories/#{category2.id}")
    expect(page).to have_content("Crappy Jobs")
  end
end
