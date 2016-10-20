FactoryGirl.define do
  factory :category do
    title "MyString"
  end

  factory :company do
    name "Some Company"
    city "Denver"

    factory :company_with_jobs do
      jobs {create_list(:job, 3)}
    end
  end

  factory :job do

    description "Do stuff for money"

    sequence :title do |n|
      "Title #{n}"
    end

    sequence :level_of_interest do |n|
      n
    end

  end
end
