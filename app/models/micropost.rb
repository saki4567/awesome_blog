class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  mount_uploader :picture, PictureUploader
  default_scope { order(created_at: :desc) }
end