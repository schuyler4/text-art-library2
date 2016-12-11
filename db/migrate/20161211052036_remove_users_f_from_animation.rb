class RemoveUsersFFromAnimation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :animations, :users, foreign_key: true
  end
end
