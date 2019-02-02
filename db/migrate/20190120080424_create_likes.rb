class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, null:false, unique: true
      t.references :item, null:false, unique: true
      t.timestamps
    end
  end
end
