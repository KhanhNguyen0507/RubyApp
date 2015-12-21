class Shop < ActiveRecord::Base
	has_many :goods

	before_save {self.email = email.downcase}
	validates :shopname, presence: true, length: {minimum: 5, maximum: 40} 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {minimum: 1, maximum: 105}, uniqueness: {case_sensitive: false},
				format: {with: VALID_EMAIL_REGEX}
end