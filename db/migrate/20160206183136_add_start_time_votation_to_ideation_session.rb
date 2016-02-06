class AddStartTimeVotationToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :start_time_votation, :datetime
  end
end
