class AddAnimationToSlide < ActiveRecord::Migration[5.0]
  def change
    add_reference :slides, :animation, foreign_key: true
  end
end
