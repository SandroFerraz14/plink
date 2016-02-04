class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :ideation_session
  has_many :votes
end
