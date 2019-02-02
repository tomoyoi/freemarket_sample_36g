class CreateItemCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_categories do |t|
      t.references :category, null: false, unique: true,foreign_key: true
      t.references :item, null: false, unique: true,foreign_key: true
      t.timestamps
    end
  end
end
