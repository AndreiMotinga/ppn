class CompanyFollower < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates_uniqueness_of :company_id, scope: :user_id
end
