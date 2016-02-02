class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :participant, index: true, foreign_key: true
      t.references :idea, index: true, foreign_key: true
      t.string :body

      t.timestamps null: false
    end
  end
end
