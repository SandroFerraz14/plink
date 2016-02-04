class AddEndTimeToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :end_time, :datetime
  end
end
