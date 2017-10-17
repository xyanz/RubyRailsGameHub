class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  # Allow picture upload on posts
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140}
end
