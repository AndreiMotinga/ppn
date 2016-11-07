class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :text, :summary
  delegate :company, to: :user

  ATTACHMENTS = %w(
    image/jpeg image/jpg image/png application/pdf application/msword
    application/vnd.openxmlformats-officedocument.wordprocessingml.attachment
  ).map(&:freeze).freeze
  has_attached_file :attachment
  validates_attachment :attachment, content_type: { content_type: ATTACHMENTS }

  scope :public_posts, -> { where(private: false) }
  scope :private_posts, -> { where(private: true) }
  scope :desc, -> { order("created_at desc") }
  scope :by_admins, ->(ids) { where(user_id: ids) }

  delegate :company_name, to: :user
end
