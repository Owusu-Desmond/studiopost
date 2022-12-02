class AddFollowerCounterAndPostCouterToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :followers_counter, :integer, default: 0
    add_column :users, :posts_counter, :integer, default: 0
  end
end
