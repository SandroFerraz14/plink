class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :idea, index: true, foreign_key: true
      t.references :participant, index: true, foreign_key: true
      t.references :ideation_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
