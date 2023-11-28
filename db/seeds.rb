require 'ffaker'

Author.destroy_all
Supplier.destroy_all
Account.destroy_all
Part.destroy_all

# Create Author
authors = []
5.times do
  authors << Author.create(name: FFaker::Name.name, cpf: FFaker::IdentificationBR.cpf)
end

# create Supplier
5.times do
  Supplier.create(name: FFaker::Company.name, cnpj: FFaker::IdentificationBR.cnpj)
end

# create Account
suppliers_ids = Supplier.pluck(:id)

suppliers_ids.each do |supplier_id|
  Account.create(digit: rand(1..50), account_number: rand(10_000..99_999).to_s, supplier_id:)
end

# create Part
part_name = ['Hard Cover', 'Soft Cover', 'Premium Cover', 'Dust Jacket', 'Comic Book Cover',
             'Standard Size Page', 'Large Print Page', 'Deckle Edge',
             'Glossy Page', 'Premium Paper Page',
             'Recycled Paper Page', 'Gilded Edge', 'Endpapers',
             'Header', 'Footer', 'Bookmark', 'Binding', 'Corner Cut',
             'Fold', 'Creases']

part_name.each_slice(4).with_index do |name_slice, index|
  name_slice.each do |name|
    Part.create(name:, part_number: rand(1_000..9_999), price: rand(1.9..99.9).round(2),
                supplier_id: suppliers_ids[index])
  end
end

# create assembly
assemblies_descriptions = {
  'paperback' => ['Soft Cover', 'Standard Size Page', 'Acid-free Page', 'Comic Book Cover', 'Bookmark'],
  'hardcover' => ['Hard Cover', 'Dust Jacket', 'Acid-free Page', 'Large Print Page', 'Header'],
  'deluxe edition' => ['Premium Cover', 'Glossy Page', 'Endpapers', 'Premium Paper Page', 'Footer'],
  "collector's edition" => ['Hard Cover', 'Gilded Edge', 'Endpapers', 'Recycled Paper Page', 'Binding'],
  'limited edition' => ['Premium Cover', 'Deckle Edge', 'Gilded Edge', 'Creases', 'Corner Cut', 'Fold']
}

assemblies_descriptions.each do |name, dscpts|
  assembly_parts = dscpts.map { |dscpt| Part.find_by(name: dscpt) }.compact
  assembly = Assembly.create(name:)
  assembly_parts << assembly.part
end
