class DashboardController < ApplicationController

  def dashboard
    @jobs_by_interest = Job.all.pluck(:level_of_interest).reduce({}) do |result, level_of_interest|
      result[level_of_interest] = Job.where(level_of_interest: level_of_interest).count
      result
    end.sort_by { |level_of_interest, count| level_of_interest }

    @top_three = Company.all.sort_by do |company|
      company.jobs.average(:level_of_interest)
    end.last(3).reverse

    @companies_by_location = Company.all.pluck(:city).reduce({}) do |result, location|
      result[location] = Company.where(city: location).count
      result
    end
  end
end
