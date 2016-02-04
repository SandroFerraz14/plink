class Vote < ActiveRecord::Base
  belongs_to :idea
  belongs_to :participant
  belongs_to :ideation_session

  validates_uniqueness_of :idea_id
end
