class AddStartTimeToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :inicio, :datetime
  end
end
