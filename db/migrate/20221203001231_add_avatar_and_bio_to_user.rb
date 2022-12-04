class AddAvatarAndBioToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :image_data, :text, default: "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"
    add_column :users, :bio, :string 
  end
end
