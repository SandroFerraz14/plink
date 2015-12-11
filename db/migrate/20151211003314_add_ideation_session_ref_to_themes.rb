class AddIdeationSessionRefToThemes < ActiveRecord::Migration
  def change
    add_reference :themes, :ideation_session, index: true, foreign_key: true
  end
end
