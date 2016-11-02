require 'rails_helper'

describe "user views a category" do
  it "shows all jobs for that category" do
    category = create(:category_with_jobs)

    visit category_path(category)

    expect(page).to have_content(category.jobs.first.title)
    expect(page).to have_content(category.jobs.second.title)
    expect(page).to have_content(category.jobs.last.title)
  end
end
