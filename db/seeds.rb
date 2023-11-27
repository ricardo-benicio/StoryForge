require 'ffaker'

Author.destroy_all
Supplier.destroy_all
Account.destroy_all

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
suppliers_id = Supplier.pluck(:id)

suppliers_id.each do |supplier_id|
  Account.create(digit: rand(1..50), account_number: rand(10_000..99_999).to_s, supplier_id:)
end
