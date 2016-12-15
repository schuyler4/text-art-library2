class User < ApplicationRecord
	before_create :confirmation
	before_save { self.email = email.downcase }

	has_secure_password

	has_many :stills
	has_many :animations

	validates :first_name, presence: true, length: {maximum: 50}

	validates :last_name, presence: true, length: {maximum: 50}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, length: {maximum: 250},
	format: { with: VALID_EMAIL_REGEX } , uniqueness: true

	validates :password, presence: true, length: {minimum: 5, maximum: 50}

	def email_active
		self.email_confirmed = true
		self.confirm_token
		save!(:validate => false)
	end

	private

	def confirmation
		if self.confirm_token.blank?
			self.confirm_token = SecureRandom.urlsafe_base64.to_s
		end
	end
end
