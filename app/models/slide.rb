class Slide < ApplicationRecord
  belongs_to :still

  validates :text, presence: true
end
