class AddPriceToParts < ActiveRecord::Migration[7.0]
  def change
    add_column :parts, :price, :decimal
  end
end
