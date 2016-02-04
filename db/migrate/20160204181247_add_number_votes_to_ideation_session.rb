class AddNumberVotesToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :number_votes, :integer
  end
end
