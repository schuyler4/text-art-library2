class Still < ApplicationRecord
  belongs_to :user, :dependent=> :destroy
  has_one :slide
end
