class RemoveAnimationsFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :references, :animations
  end
end
