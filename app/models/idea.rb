class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :ideation_session
end