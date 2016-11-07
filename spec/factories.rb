FactoryGirl.define do
  factory :user do
    
  end
  factory :post do
    title { FFaker::Lorem.sentence }
    slug nil
    text { FFaker::Lorem.paragraph(5) }
    private false
  end
end
