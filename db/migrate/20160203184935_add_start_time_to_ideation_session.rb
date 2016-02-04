class AddStartTimeToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :start_time, :datetime
  end
end
