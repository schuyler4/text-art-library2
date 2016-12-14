class AddAnimationToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :animation, foreign_key: true
  end
end
