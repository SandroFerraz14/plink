class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :ideation_session
  has_many :comments, :dependent => :delete_all
  has_many :votes, :dependent => :delete_all
end
