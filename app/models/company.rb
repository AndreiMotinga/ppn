class Company < ApplicationRecord
  has_many :admins, class_name: User
end
