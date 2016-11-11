class Company < ApplicationRecord
  has_many :admins, class_name: User
  has_many :posts, through: :admins
  has_many :company_investors
  has_many :investors, through: :company_investors, source: "user"
  has_many :company_followers
  has_many :followers, through: :company_followers, source: "user"

  validates_presence_of :name, :description, :address, :phone, :email

  # todo test
  def investor?(user)
    investors.include?(user)
  end

  # todo test
  def admin?(user)
    admins.include?(user)
  end

  # todo test
  def public_posts(page)
    ids = admins.pluck(:id)
    Post.public_posts.desc.by_admins(ids).page(page)
  end

  # todo test
  def private_posts(page)
    ids = admins.pluck(:id)
    Post.private_posts.desc.by_admins(ids).page(page)
  end
end
