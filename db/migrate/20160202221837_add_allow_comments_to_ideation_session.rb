class AddAllowCommentsToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :allow_comments, :boolean
  end
end
