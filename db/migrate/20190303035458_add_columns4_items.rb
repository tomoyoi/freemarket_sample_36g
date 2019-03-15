class AddColumns4Items < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :seize, foreign_key: true
  end
end
