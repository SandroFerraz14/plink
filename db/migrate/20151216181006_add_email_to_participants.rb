class AddEmailToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :email, :string
  end
end
