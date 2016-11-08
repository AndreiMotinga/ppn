class Company < ApplicationRecord
  has_many :admins, class_name: User
  has_many :company_investors
  has_many :investors, through: :company_investors, source: "user"
end
