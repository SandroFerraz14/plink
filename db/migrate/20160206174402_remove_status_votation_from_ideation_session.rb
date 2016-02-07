class RemoveStatusVotationFromIdeationSession < ActiveRecord::Migration
  def change
    remove_column :ideation_sessions, :status, :boolean
  end
end
