class Micropost < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  # Returns a user's status feed.
  def comment_feed
    Comment.where("micropost_id = :micropost_id", micropost_id: id)
  end
end
