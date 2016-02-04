class Vote < ActiveRecord::Base
  belongs_to :idea
  belongs_to :participant
  belongs_to :ideation_session

  validates :idea_id, uniqueness: { scope: [:ideation_session_id, :participant_id] }
end
