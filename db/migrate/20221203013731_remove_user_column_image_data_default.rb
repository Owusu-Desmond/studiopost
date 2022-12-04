class RemoveUserColumnImageDataDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :image_data, nil
  end
end
