class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image, null: false
      t.references :item, foreign_key: true, index: true, null:false
      t.timestamps null: true
    end
  end
end
