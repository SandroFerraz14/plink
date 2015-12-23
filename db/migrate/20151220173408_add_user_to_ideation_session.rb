class AddUserToIdeationSession < ActiveRecord::Migration
  def change
    add_reference :ideation_sessions, :user, index: true, foreign_key: true
  end
end
