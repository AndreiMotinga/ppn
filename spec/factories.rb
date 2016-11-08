FactoryGirl.define do
  factory :company_follower do
    company
    user
  end

  factory :company_investor do
    company
    user
  end

  factory :company do
    name { FFaker::Company.name }
    description { FFaker::Lorem.paragraph(5) }
    address do
      [FFaker::Address.street_address,
       FFaker::Address.city,
       "New York"].join(" ")
    end
    phone { FFaker::PhoneNumber.phone_number }
    email { FFaker::Internet.email }
  end

  factory :user do
    email { FFaker::Internet.email }
    password "password"
    password_confirmation "password"
    name { FFaker::Name.name }
    phone { FFaker::PhoneNumber.phone_number }
    country { FFaker::Address.country_code }
    trait :with_company do
      company
    end
  end

  factory :post do
    title { FFaker::Lorem.sentence }
    text { FFaker::Lorem.paragraph(5) }
    private false
  end
end
