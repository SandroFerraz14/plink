class AddAvailableToIdeationSessions < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :available, :boolean
  end
end
