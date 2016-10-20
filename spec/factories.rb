FactoryGirl.define do

  factory :company do

    city "Denver"

    sequence :name do |n|
      "Some Company #{n}"
    end

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

  factory :category do

    sequence :title do |n|
      "Sweet Jobs #{n}"
    end

    factory :category_with_jobs do
      jobs {create_list(:job, 3)}
    end
  end
end
