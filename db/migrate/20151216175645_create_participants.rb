class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ideation_session, index: true, foreign_key: true
      t.string :nickname
      t.string :avatar_file_name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
