class AddEndTimeToIdeationSessions < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :end, :datetime
  end
end
