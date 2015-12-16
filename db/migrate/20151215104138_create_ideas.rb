class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ideation_session, index: true, foreign_key: true
      t.text :text
      t.string :color
      t.integer :number

      t.timestamps null: false
    end
  end
end
