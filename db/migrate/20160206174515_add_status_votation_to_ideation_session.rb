class AddStatusVotationToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :status_votation, :boolean
  end
end
