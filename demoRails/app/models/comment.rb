class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  validates :content, presence: true
  validates :user_id, presence: true
  validates :micropost_id, presence: true

  # Returns a user's status feed.
  def comment_feed
    Comment.where("micropost_id = :micropost_id", micropost_id: id)
  end

end
