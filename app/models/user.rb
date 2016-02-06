class User < ActiveRecord::Base
	has_many :ideas, :dependent => :delete_all
	has_many :participants, :dependent => :delete_all
	  # Include default devise modules. Others available are:
	  # :confirmable, :lockable, :timeoutable and :omniauthable
	  devise :invitable, :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable

    has_attached_file :user_photo, styles: { medium: "300x300>", small: "150x150>", thumb: "100x100>" }
    validates_attachment_content_type :user_photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
