class CreateSeizes < ActiveRecord::Migration[5.2]
  def change
    create_table :seizes do |t|
      t.string :size, null: false
    end
  end
end
