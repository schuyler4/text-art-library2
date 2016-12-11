class AddAnimationsToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :animations, :users, foreign_key: true
  end
end
