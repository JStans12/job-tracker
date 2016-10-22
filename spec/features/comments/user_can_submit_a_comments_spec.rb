require 'rails_helper'

describe 'User submits a comment on a job' do
  scenario 'User sees comment on job page' do

    company = create(:company_with_jobs_with_categories)
    job = company.jobs.first

    visit company_job_path(company.id, job.id)

    fill_in 'comment[content]', with: "This job is ok."
    click_on 'Create Comment'
    fill_in 'comment[content]', with: "This job is not ok."
    click_on 'Create Comment'

    save_and_open_page

    expect(page).to have_content("This job is ok.")
    expect(page).to have_content("This job is not ok.")
  end
end
