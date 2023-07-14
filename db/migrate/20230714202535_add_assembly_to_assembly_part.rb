class AddAssemblyToAssemblyPart < ActiveRecord::Migration[7.0]
  def change
    add_reference :assembly_parts, :assembly, null: false, foreign_key: true
  end
end
