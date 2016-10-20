require 'rails_helper'

describe "User updates an existing job" do
  scenario "user sees changes on job page" do

    company = create(:company_with_jobs)
    job_one = company.jobs.first

    visit "/companies/#{company.id}/jobs/#{job_one.id}"
    click_on "Edit"
    fill_in "job_description", with: "make so much money"
    click_on "Update"

    within(:css, ".success") do
      expect(page).to have_content("You updated")
    end

    expect(page).to have_content "make so much money"
    expect(page).to have_current_path(company_job_path(company, job_one))
  end
end
