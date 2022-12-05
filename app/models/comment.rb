class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_comments_counter

  validates :user_id, presence: true
  validates :post_id, presence: true

  private

  def update_post_comments_counter
    post.update(comments_counter: post.comments_counter + 1)
  end
end
