class User < ApplicationRecord
  has_secure_password
  has_many :still

  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 50}
end
