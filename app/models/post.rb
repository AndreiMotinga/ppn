class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :text
  delegate :company, to: :user

  ATTACHMENTS = %w(
    image/jpeg image/jpg image/png application/pdf application/msword
    application/vnd.openxmlformats-officedocument.wordprocessingml.attachment
  ).map(&:freeze).freeze
  has_attached_file :attachment
  validates_attachment :attachment, content_type: { content_type: ATTACHMENTS }
end
