class AddUserPhotoFileNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_photo_file_name, :string
  end
end
