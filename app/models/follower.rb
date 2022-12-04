class Follower < ApplicationRecord
  belongs_to :user

  after_create :update_user_followers_counter

  private

  def update_user_followers_counter
    user.update(followers_counter: user.followers_counter + 1)
  end
end
