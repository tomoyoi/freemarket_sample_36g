class SeizeDestroy < ActiveRecord::Migration[5.2]
  def change
    drop_table :seizes
  end
end
