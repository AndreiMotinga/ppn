class Company < ApplicationRecord
  has_many :admins, class_name: User
  has_many :posts, through: :admins
  has_many :company_investors
  has_many :investors, through: :company_investors, source: "user"
  has_many :company_followers
  has_many :followers, through: :company_followers, source: "user"

  def private_posts
    ids = admins.pluck(:id)
    Post.private_posts.by_admins(ids)
  end

  def public_posts
    ids = admins.pluck(:id)
    Post.public_posts.by_admins(ids)
  end
end
