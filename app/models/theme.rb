class Theme < ActiveRecord::Base
	belongs_to :ideation_session
	has_many :ideas
end
