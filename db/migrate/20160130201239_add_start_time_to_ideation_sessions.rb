class AddStartTimeToIdeationSessions < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :start, :datetime
  end
end
