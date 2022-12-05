class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :text, presence: true, length: { minimum: 1 }
  validates :likes_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :comments_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  after_create :update_user_posts_counter

  private

  def update_user_posts_counter
    user.update(posts_counter: user.posts_counter + 1)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(3)
  end
end
