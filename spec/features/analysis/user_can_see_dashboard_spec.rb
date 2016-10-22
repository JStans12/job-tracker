require 'rails_helper'

  describe "user navigates to /dashboard" do
    scenario "user sees table of jobs by level of interest" do
      create_list(:company_with_jobs_with_categories, 7)

      visit '/dashboard'

      expect(page).to have_content("Interest Level")
      expect(page).to have_content("Number of Jobs")
  end
end
