require 'ffaker'

Author.destroy_all

#Create Author
authors = []
5.times do
  authors << Author.create(name: FFaker::Name.name, cpf: FFaker::IdentificationBR.cpf)
end