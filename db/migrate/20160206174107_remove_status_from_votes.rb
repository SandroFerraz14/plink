class RemoveStatusFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :status, :boolean
  end
end
