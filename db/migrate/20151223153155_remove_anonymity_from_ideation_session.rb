class RemoveAnonymityFromIdeationSession < ActiveRecord::Migration
  def change
    remove_column :ideation_sessions, :anonymity, :boolean
  end
end
