class Comment < ActiveRecord::Base
  belongs_to :participant
  belongs_to :idea
end
