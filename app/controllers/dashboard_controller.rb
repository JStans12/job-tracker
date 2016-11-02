class DashboardController < ApplicationController

  def dashboard
    @jobs_by_interest = Job.sort_by_interest

    @top_three = Company.top_three_by_interest

    @companies_by_location = Company.count_by_location
  end
end
