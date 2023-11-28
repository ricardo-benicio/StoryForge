require 'ffaker'

Author.destroy_all
Supplier.destroy_all
Account.destroy_all
Part.destroy_all

#Create Author
authors = []
5.times do
  authors << Author.create(name: FFaker::Name.name, cpf: FFaker::IdentificationBR.cpf)
end

#create Supplier
5.times do
  Supplier.create(name: FFaker::Company.name, cnpj: FFaker::IdentificationBR.cnpj)
end

#create Account
suppliers_ids = Supplier.pluck(:id)

suppliers_ids.each do |supplier_id|
  Account.create(digit: rand(1..50), account_number: rand(10_000..99_999).to_s, supplier_id:)
end

#create Part
part_name = ["Hard Cover", "Soft Cover", "Premium Cover", "Dust Jacket", "Comic Book Cover",
             "Standard Size Page", "Large Print Page", "Deckle Edge",
             "Glossy Page", "Premium Paper Page",
             "Recycled Paper Page", "Gilded Edge", "Endpapers",
             "Header", "Footer", "Bookmark", "Binding", "Corner Cut",
             "Fold", "Creases"]

part_name.each_slice(4).with_index do |name_slice, index|
  name_slice.each do |name|
    Part.create(name:, part_number: rand(1_000..9_999), price: rand(1.9..99.9).round(2),
                supplier_id: suppliers_ids[index])
  end
end
