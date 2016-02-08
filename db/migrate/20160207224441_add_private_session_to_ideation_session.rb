class AddPrivateSessionToIdeationSession < ActiveRecord::Migration
  def change
    add_column :ideation_sessions, :private_session, :boolean
  end
end
