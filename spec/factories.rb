FactoryGirl.define do
  factory :company do
    name "MyString"
    description "MyText"
    address "MyString"
    phone "MyString"
    email "MyString"
  end
  factory :user do
    
  end
  factory :post do
    title { FFaker::Lorem.sentence }
    slug nil
    text { FFaker::Lorem.paragraph(5) }
    private false
  end
end
