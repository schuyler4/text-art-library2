class RemoveStillFromSlide < ActiveRecord::Migration[5.0]
  def change
    remove_reference :slides, :still, foreign_key: true
  end
end
