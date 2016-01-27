class AddImageToNicknamesFeed < ActiveRecord::Migration
  def change
    add_column :nicknames_feeds, :image_url, :string
  end
end
