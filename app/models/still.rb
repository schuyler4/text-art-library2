class Still < ApplicationRecord
  belongs_to :user, :dependent=> :destroy
  has_one :slide

  validates :title, presence: true, length: {maximum: 50}
end
