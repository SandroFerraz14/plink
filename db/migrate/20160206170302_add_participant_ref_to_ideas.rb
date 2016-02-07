class AddParticipantRefToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :participant, index: true, foreign_key: true
  end
end
