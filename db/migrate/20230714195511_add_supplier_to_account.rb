class AddSupplierToAccount < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :supplier, null: false, foreign_key: true
  end
end
