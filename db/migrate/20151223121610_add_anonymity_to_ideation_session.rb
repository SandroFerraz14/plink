class AddAnonymityToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :anonymity, :boolean
  end
end
