class Vote < ActiveRecord::Base
  belongs_to :idea
  belongs_to :participant
  belongs_to :ideation_session
end
