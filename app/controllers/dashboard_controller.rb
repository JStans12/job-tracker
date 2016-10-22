class DashboardController < ApplicationController

  def dashboard
    @companies = Company.all
    @jobs = Job.all
    @jobs_by_interest = @jobs.pluck(:level_of_interest).reduce({}) do |result, level_of_interest|
      result[level_of_interest] = Job.where(level_of_interest: level_of_interest).count
      result
    end.sort_by { |level_of_interest, count| level_of_interest }
  end

end
