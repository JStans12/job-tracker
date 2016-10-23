FactoryGirl.define do

  factory :company do

    city "Denver"

    sequence :name do |n|
      "Some Company #{n}"
    end

    factory :company_with_jobs_with_categories do
      jobs {create_list(:job, 3)}
    end
  end

  factory :job do

    description "Do stuff for money"

    category {create(:category)}

    sequence :title do |n|
      "Title #{n}"
    end

    sequence :level_of_interest do |n|
      n
    end

    factory :job_with_company do
      company {create(:company)}
    end
  end

  factory :category do

    sequence :title do |n|
      "Sweet Jobs #{n}"
    end

    factory :category_with_jobs do
      jobs {create_list(:job_with_company, 3)}
    end
  end
end
