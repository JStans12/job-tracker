require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "valid attributes" do

      it "is valid with title" do
        category = Category.new(title: "cool jobs")

        expect(category).to be_valid
      end
    end
    context "invalid attributes" do
      it "is invalid without title" do
        category = Category.new()

        expect(category).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "has_many jobs" do
      category = Category.new(title: "cool jobs")

      expect(category).to respond_to(:jobs)
    end
  end
end
