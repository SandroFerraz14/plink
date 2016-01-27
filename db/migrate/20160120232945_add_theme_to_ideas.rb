class AddThemeToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :theme, index: true, foreign_key: true
  end
end
