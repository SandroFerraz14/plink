class IdeationSession < ActiveRecord::Base
	has_many :themes

	accepts_nested_attributes_for :themes, :allow_destroy => true
end
