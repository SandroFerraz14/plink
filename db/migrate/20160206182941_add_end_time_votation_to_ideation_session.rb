class AddEndTimeVotationToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :end_time_votation, :datetime
  end
end
