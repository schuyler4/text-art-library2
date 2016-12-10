class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password
  has_many :stills

  validates :first_name, presence: true, length: {maximum: 50}

  validates :last_name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: {maximum: 250},
    format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  validates :password, presence: true
end
