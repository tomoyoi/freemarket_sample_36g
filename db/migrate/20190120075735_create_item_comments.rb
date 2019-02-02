class CreateItemComments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_comments do |t|
      t.references :user, foreign_key: true, unique: true, null:false
      t.references :item, foreign_key: true, unique: true, null:false
      t.text :comment
      t.timestamps
    end
  end
end
