require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do

    it "is valid with title" do
      category = Category.new(title: "cool jobs")

      expect(category).to be_valid
    end

    it "is invalid without title" do
      category = Category.new()

      expect(category).to be_invalid
    end
  end
end
