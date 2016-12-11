class Still < ApplicationRecord
  belongs_to :user, :dependent=> :destroy
  has_one :slide

  validates :title, presence: true, length: {maximum: 50}

  def editor?
  	self.user.id == current_user.id
  end
end
