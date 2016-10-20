require 'rails_helper'

describe "User creates a new category" do
  scenario "user can create a new category" do

    visit new_category_path
    fill_in "category[title]", with: "Things and stuff"
    click_on "Create"

    expect(page).to have_current_path("/categories")
    expect(page).to have_link("Things and stuff")
  end
end
