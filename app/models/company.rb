class Company < ApplicationRecord
  has_many :admins, class_name: User
  has_many :posts, through: :admins
  has_many :company_investors
  has_many :investors, through: :company_investors, source: "user"
  has_many :company_followers
  has_many :followers, through: :company_followers, source: "user"

  # todo test
  def investor?(user)
    investors.include?(user)
  end

  # todo test
  def admin?(user)
    admins.include?(user)
  end
end
