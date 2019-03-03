class AddColumns5Items < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :seize, foreign_key: true
  end
end
