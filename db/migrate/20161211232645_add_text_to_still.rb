class AddTextToStill < ActiveRecord::Migration[5.0]
  def change
    add_column :stills, :text, :text
  end
end
