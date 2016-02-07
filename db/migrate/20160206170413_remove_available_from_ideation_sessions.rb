class RemoveAvailableFromIdeationSessions < ActiveRecord::Migration
  def change
    remove_column :ideation_sessions, :available, :boolean
  end
end
