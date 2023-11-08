require 'ffaker'

Author.destroy_all

#Create Author
authors = []
5.times do
  authors << Author.create(name: FFaker::Name.name, cpf: FFaker::IdentificationBR.cpf)
end

#create Supplier
5.times do
  Supplier.create(name: FFaker::Company.name, cnpj: FFaker::IdentificationBR.cnpj)
end