class User < ActiveRecord::Base

	has_many :projects
	has_many :drafts, :through => :projects
    
    has_secure_password

	before_save { self.email = email.downcase } 

	validates :name, presence: true, length: { minimum: 3, maximum: 30 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }



end