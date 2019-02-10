class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :condition, :string
    add_column :items, :delivery_method, :string
    add_column :items, :standard_shipping_time, :string
  end
end
