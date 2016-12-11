class AddUserToAnimation < ActiveRecord::Migration[5.0]
  def change
    add_reference :animations, :user, foreign_key: true
  end
end
