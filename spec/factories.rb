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
    name "MyString"
    description "MyText"
    address "MyString"
    phone "MyString"
    email "MyString"
  end

  factory :user do
    password "password"
    password_confirmation "password"
    email { FFaker::Internet.email }
    name { FFaker::Name.name  }
    phone { FFaker::PhoneNumber.phone_number }
    country "US"
    trait :with_company do
      company
    end
  end

  factory :post do
    title { FFaker::Lorem.sentence }
    slug nil
    text { FFaker::Lorem.paragraph(5) }
    private false
  end
end
