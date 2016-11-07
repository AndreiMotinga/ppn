class Company < ApplicationRecord
  has_many :admins, class_name: User
  has_many :posts, through: :admins
  has_many :company_investors
  has_many :investors, through: :company_investors, source: "user"
  has_many :company_followers
  has_many :followers, through: :company_followers, source: "user"

  validates_presence_of :name, :description, :address, :phone, :email

  has_attached_file :logo, styles: { medium: "200x200>" }
  validates_attachment_content_type :logo, content_type: %r{\Aimage\/.*\z}

  def public_posts(page)
    posts.includes(user: :company).public_posts.desc.page(page)
  end

  def private_posts(page)
    posts.includes(user: :company).private_posts.desc.page(page)
  end
end
