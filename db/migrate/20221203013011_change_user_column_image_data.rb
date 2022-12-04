class ChangeUserColumnImageData < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :image_data, :text
  end
end
