require 'rails_helper'

describe "User deletes an existing job" do
  scenario "user does not see delete job on company_job index" do

    company = create(:company_with_jobs)
    job_one = company.jobs.first

    visit "/companies/#{company.id}/jobs/#{job_one.id}"
    click_on "Delete"

    expect(page).to_not have_content(job_one.title)
    expect(page).to have_current_path(company_jobs_path(company))
  end
end
