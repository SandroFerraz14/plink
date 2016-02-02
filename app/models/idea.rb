class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :ideation_session
  belongs_to :theme
  before_save :default_values
  has_many :comments


  def default_values
    self.theme_id ||= GlobalConstants::DefaultTheme
  end
end
