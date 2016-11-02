require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = create(:company_with_jobs_with_categories)

    visit company_job_path(company, company.jobs.first)

    expect(page).to have_content("Title")
    expect(page).to have_content("Do stuff for money")
    expect(page).to have_content(company.jobs.first.level_of_interest)
  end
end
