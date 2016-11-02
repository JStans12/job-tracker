require 'rails_helper'

describe "user navigates to /dashboard" do
  scenario "user sees table of jobs by level of interest" do
    create_list(:company_with_jobs_with_categories, 7)

    visit '/dashboard'

    within(:css, '.jobs_by_interest') do
      expect(page).to have_content("Interest Level")
      expect(page).to have_content("Number of Jobs")
      expect(page).to have_content(28)
    end
  end

  scenario "user sees top three companies by interest level" do
    create_list(:company_with_jobs_with_categories, 7)

    visit '/dashboard'

    within(:css, '.top_three') do
      expect(page).to have_content("Company Name")
      expect(page).to have_content("Level of Interest")
      expect(page).to have_content("Some Company 20")
      expect(page).to have_content(49)
    end
  end

  scenario "user sees list of companies by location" do
    create_list(:company_with_jobs_with_categories, 7)

    visit '/dashboard'

    within(:css, '.companies_by_location') do
      expect(page).to have_content("Location")
      expect(page).to have_content("Number of Companies")
      expect(page).to have_link("Denver")
      expect(page).to have_content(7)
    end
  end

end
