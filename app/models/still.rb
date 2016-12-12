class Still < ApplicationRecord
  belongs_to :user, :dependent=> :destroy

  validates :title, presence: true, length: {maximum: 50}
  validates :text, presence: true
end
