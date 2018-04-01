class User < ApplicationRecord
	before_validation :make_email_lower, on: :create
	validates :username, :email, :password, presence: true
	validates :username, :email, uniqueness: true
	has_secure_password
	has_many :posts

	def make_email_lower
		self.email.downcase!
	end
end
