class IdeationSession < ActiveRecord::Base
	has_many :themes, :dependent => :delete_all
	has_many :ideas, :dependent => :delete_all
	has_many :participants, :dependent => :delete_all
	accepts_nested_attributes_for :themes, :allow_destroy => true
end
