require 'rails_helper'

describe "User creates a new category" do
  scenario "user can create a new category" do

    visit new_category_path
    fill_in "category[title]", with: "Things and stuff"
    click_on "Create"

    expect(page).to have_current_path("/categories/#{Category.find_by(title: 'Things and stuff').id}")
    expect(page).to have_content("Things and stuff")
  end

  context "user tries to create a category that already exists" do
    scenario "user is returned to create page with errors" do

      category = create(:category)

      visit new_category_path
      fill_in "category[title]", with: category.title
      click_on "Create"

      expect(page).to have_content("Create a new category")
      expect(page).to have_content("Title has already been taken")
    end
  end
end
