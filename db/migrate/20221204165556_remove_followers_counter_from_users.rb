class RemoveFollowersCounterFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :followers_counter, :integer
  end
end
