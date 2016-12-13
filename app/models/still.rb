class Still < ApplicationRecord
  belongs_to :user, :dependent=> :destroy

  validates :title, presence: true, length: {maximum: 50}
  validates :text, presence: true

  def self.search(search)
  	where("title ILIKE ? OR text ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
