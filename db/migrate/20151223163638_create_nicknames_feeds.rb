class CreateNicknamesFeeds < ActiveRecord::Migration
  def change
    create_table :nicknames_feeds do |t|
      t.string :nick

      t.timestamps null: false
    end
  end
end
