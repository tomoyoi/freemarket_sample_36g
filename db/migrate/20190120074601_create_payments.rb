class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :card_number, null:false, unique: true
      t.string :expire_month, null:false
      t.string :expire_year, null:false
      t.string :security_code, null:false
      t.references :user, foreign_key: true, index: true, null:false
      t.timestamps
    end
  end
end
