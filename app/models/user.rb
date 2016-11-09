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

  def country_name
    country = self.country
    ISO3166::Country[country]
  end

  def can_write?
    company.present?
  end

  def private_posts
    posts.private_posts
  end

  def public_posts
    posts.public_posts
  end
end
