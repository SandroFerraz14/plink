class AddNideasToIdeationSessions < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :nideas, :integer
  end
end
