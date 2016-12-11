class Slide < ApplicationRecord

  belongs_to :still, :class_name => 'Still',:foreign_key => 'still_id'
  belongs_to :animation, :class_name => 'Animation' ,:foreign_key => 'animation_id'

  validates :text, presence: true

  def editor?
  	self.user.id == current_user.id
  end
end
