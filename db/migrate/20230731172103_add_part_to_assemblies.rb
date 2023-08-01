class AddPartToAssemblies < ActiveRecord::Migration[7.0]
  def change
    add_reference :assemblies, :part, null: false, foreign_key: true
  end
end
