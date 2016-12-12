class Animation < ApplicationRecord
	after_initialize :set_slides, unless: :persisted?

	belongs_to :user
	has_many :slides

	validates :title, presence: true

	def add_slides
		self.slides += 1
	end

  private

  def set_slides
  	self.slides ||= 0
  end

end
