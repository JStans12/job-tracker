require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new(city: "Denver")
        expect(company).to be_invalid
      end

      it "is invalid without a city" do
        company = Company.new(name: "Ericsson")
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox", city: "Denver")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name and city" do
        company = Company.new(name: "Dropbox", city: "Denver")
        expect(company).to be_valid
      end
    end
  end

  describe "model methods" do
    it "finds top three companies by interest level" do
      company_one, company_two, company_three, company_four = create_list(:company_with_jobs_with_categories, 4)

      company_one.jobs.first.update(level_of_interest: 1000)
      company_two.jobs.first.update(level_of_interest: 1000)
      company_three.jobs.first.update(level_of_interest: -1000)
      company_four.jobs.first.update(level_of_interest: 1000)

      expect(Company.top_three_by_interest).to_not include(company_three)
      expect(Company.top_three_by_interest).to include(company_one)
      expect(Company.top_three_by_interest).to include(company_two)
      expect(Company.top_three_by_interest).to include(company_four)
    end

    it "counts companies by location" do
      Company.create(name: "Dropbox", city: "Denver")
      Company.create(name: "things", city: "Atlanta")
      Company.create(name: "stuff", city: "Denver")

      expect(Company.count_by_location).to eq({"Denver"=>2, "Atlanta"=>1})
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox", city: "Denver")
      expect(company).to respond_to(:jobs)
    end
  end
end
