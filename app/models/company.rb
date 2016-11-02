class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def self.top_three_by_interest
    self.all.sort_by do |company|
      company.jobs.average(:level_of_interest)
    end.last(3).reverse
  end

  def self.count_by_location
    self.all.pluck(:city).reduce({}) do |result, location|
      result[location] = Company.where(city: location).count
      result
    end
  end
end
