class AddUserToStill < ActiveRecord::Migration[5.0]
  def change
    add_reference :stills, :user, foreign_key: true
  end
end
