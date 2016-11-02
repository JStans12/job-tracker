require 'rails_helper'

describe "User navigates to categories index" do
  scenario "user sees all categories" do
    category1, category2, category3 = create_list(:category_with_jobs, 3)

    visit categories_path

    expect(page).to have_content("All Categories")
    expect(page).to have_link(category2.title)
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
  end
end
