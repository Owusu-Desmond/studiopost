class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_likes_counter

  validates :user_id, presence: true
  validates :post_id, presence: true

  private

  def update_post_likes_counter
    post.update(likes_counter: post.likes_counter + 1)
  end
end
