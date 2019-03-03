class CreateSeizesForces < ActiveRecord::Migration[5.2]
  def change
    create_table :seizes__forces do |t|

      t.timestamps
    end
  end
end
