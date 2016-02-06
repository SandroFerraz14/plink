class AddStatusToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :status, :boolean
  end
end
