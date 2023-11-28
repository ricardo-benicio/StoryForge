class CreateAssemblyParts < ActiveRecord::Migration[7.0]
  def change
    create_table :assembly_parts do |t|
      t.references :assembly, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true

      t.timestamps
    end
  end
end
