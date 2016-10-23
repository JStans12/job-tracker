class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_interest
    self.all.pluck(:level_of_interest).reduce({}) do |result, level_of_interest|
      result[level_of_interest] = Job.where(level_of_interest: level_of_interest).count
      result
    end.sort_by { |level_of_interest, count| level_of_interest }
  end
end
