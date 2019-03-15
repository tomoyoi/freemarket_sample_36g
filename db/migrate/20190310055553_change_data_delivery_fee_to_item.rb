class ChangeDataDeliveryFeeToItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :delivery_fee, :string
  end
end
