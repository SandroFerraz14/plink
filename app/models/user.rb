class User < ActiveRecord::Base
	has_many :ideas, :dependent => :delete_all
	has_many :participants, :dependent => :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
