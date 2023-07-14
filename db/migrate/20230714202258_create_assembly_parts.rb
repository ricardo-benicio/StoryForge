class CreateAssemblyParts < ActiveRecord::Migration[7.0]
  def change
    create_table :assembly_parts do |t|

      t.timestamps
    end
  end
end
