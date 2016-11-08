class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company, optional: true
  has_many :company_investors
  has_many :investing_companies, through: :company_investors, source: "company"

  def country_name
    country = self.country
    ISO3166::Country[country]
  end

  def can_write?
    company.present?
  end
end
