class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_comments_posts_counter

  private

  def update_comments_posts_counter
    post.increment!(:comments_counter)
  end
end
