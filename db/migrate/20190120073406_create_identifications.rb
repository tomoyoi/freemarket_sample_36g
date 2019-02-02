class CreateIdentifications < ActiveRecord::Migration[5.2]
  def change
    create_table :identifications do |t|
      t.string :lastname, null:false
      t.string :firstname, null:false
      t.string :lastname_kana, null:false
      t.string :firstname_kana, null:false
      t.string :postcode, null:false
      t.string :prefecture, null:false
      t.string :city, null:false
      t.string :house_number, null:false
      t.string :birthday, null:false
      t.references :user, foreign_key: true, index: true, null:false
      t.timestamps
    end
  end
end
