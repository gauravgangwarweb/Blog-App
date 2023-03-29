class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def update_users_posts_counter
    user.increment(:posts_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
