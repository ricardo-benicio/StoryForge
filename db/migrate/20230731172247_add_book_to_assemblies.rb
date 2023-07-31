class AddBookToAssemblies < ActiveRecord::Migration[7.0]
  def change
    add_reference :assemblies, :book, null: false, foreign_key: true
  end
end
