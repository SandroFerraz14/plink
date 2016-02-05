class Theme < ActiveRecord::Base
	belongs_to :ideation_session
	has_many :ideas, :dependent => :delete_all

	validates :name, presence: true, uniqueness: {scope: :ideation_session, case_sensitive: false}
end
