class CreateStills < ActiveRecord::Migration[5.0]
  def change
    create_table :stills do |t|
      t.string :title

      t.timestamps
    end
  end
end
