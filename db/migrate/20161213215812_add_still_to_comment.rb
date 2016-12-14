class AddStillToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :still, foreign_key: true
  end
end
