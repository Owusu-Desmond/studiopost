class DropFollowersTableAndRemoveUserRef < ActiveRecord::Migration[7.0]
  def change
    drop_table :followers
  end
end
