class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :delivery_fee, null: false
      t.string :area, null: false
      t.integer :price, null:false
      t.string :size, null: false
      t.timestamps null: true
    end
  end
end
