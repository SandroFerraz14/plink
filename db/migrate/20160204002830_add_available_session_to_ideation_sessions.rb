class AddAvailableSessionToIdeationSessions < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :available_session, :boolean
  end
end
