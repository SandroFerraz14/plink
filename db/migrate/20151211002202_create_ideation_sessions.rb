class CreateIdeationSessions < ActiveRecord::Migration
  def change
    create_table :ideation_sessions do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
