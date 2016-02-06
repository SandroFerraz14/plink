class RemoveUserPhotoFileNameFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :user_photo_file_name, :string
    remove_column :users, :string, :string
  end
end
