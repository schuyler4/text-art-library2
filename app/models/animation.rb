class Animation < ApplicationRecord
	after_initialize :set_slides, unless: :persisted?

	belongs_to :user
	has_many :slides

	validates :title, presence: true

	def editor?
  		self.user.id == current_user.id
  	end

  	def add_slides
  		self.slides += 1
  	end

  	private

  	def set_slides
  		self.slides ||= 0
  	end
end
