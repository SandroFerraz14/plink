class RemoveUserIdFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :user_id, :integer
  end
end
