class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company, optional: true
  has_many :posts
  has_many :company_investors
  has_many :investing_companies, through: :company_investors, source: "company"
  has_many :company_followers
  has_many :following_companies, through: :company_followers, source: "company"

  def has_company?
    company.present?
  end

  def company_name
    company.name
  end

  def investor_of?(company)
    investing_companies.include?(company)
  end

  def admin_of?(company)
    company_id == company.id
  end
end
