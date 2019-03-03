class SeizeDestroy2 < ActiveRecord::Migration[5.2]
  def change
    drop_table :seizes__forces
  end
end
