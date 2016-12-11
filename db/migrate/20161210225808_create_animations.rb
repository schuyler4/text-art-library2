class CreateAnimations < ActiveRecord::Migration[5.0]
  def change
    create_table :animations do |t|
      t.string :title
      t.integer :slides

      t.timestamps
    end
  end
end
