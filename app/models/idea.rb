class Idea < ActiveRecord::Base
  belongs_to :participant
  belongs_to :ideation_session
  belongs_to :theme
  has_many :votes, :dependent => :delete_all
  before_save :default_values
  has_many :comments, :dependent => :delete_all


  def default_values
    self.theme_id ||= GlobalConstants::DefaultTheme
  end
end
