require 'rails_helper'

describe 'User submits a contact on a company' do
  scenario 'User sees contacts listed on company page' do

    company = create(:company_with_jobs_with_categories)

    visit company_path(company)

    fill_in 'contact[name]', with: "Jimbo"
    fill_in 'contact[position]', with: "Janitor"
    fill_in 'contact[email]', with: "cleanjim@jobs.com"
    click_on 'Create Contact'
    fill_in 'contact[name]', with: "Bob"
    fill_in 'contact[position]', with: "Lion Tamer"
    fill_in 'contact[email]', with: "cleanbob@jobs.com"
    click_on 'Create Contact'

    expect(page).to have_content("Jimbo")
    expect(page).to have_content("Lion Tamer")
  end
end
