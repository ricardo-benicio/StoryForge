# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'ffaker'

Author.destroy_all
Supplier.destroy_all
Account.destroy_all
Part.destroy_all
Assembly.destroy_all
Book.destroy_all
ActiveRecord::Base.connection.execute("DELETE FROM assembly_parts")

5.times do
  Author.create(name: FFaker::Name.name)
  Author.create(cpf: FFaker::IdentificationBR.cpf)
end

5.times do
  Supplier.create(name: FFaker::Name.name)
  Supplier.create(cnpj: FFaker::IdentificationBR.cnpj)
end

suppliers_ids = Supplier.pluck(:id)

suppliers_ids.each do |supplier|
  account_number = rand(10_000..99_000).to_s
  account = Account.create(account_number:, supplier_id:)
  account.update(check_digit: rand(0..9).to_s)
end

parts = 20.times.map do
  Part.create(part_number: rand(10_000..99_999).to_s,
              supplier_id: Supplier.pluck(:id).sample)
end

assemblies = %w[LibreArt BrosLimited KamaDelux DefineEdition GalaxyNo].map do |n|
  Assembly.create(name: n)
end

parts.each do |part|
  part.assembly << assemblies.sample(rand(1..5))
end

5.times do
  random_author_id = Author.pluck(:id).sample
  book = Book.create(published_at: FFaker::Time.between(DateTime.now - 1.year, DateTime.now),
                     author_id: random_author_id,
                     title: FFaker::Book.title)
  #book.assembly << assemblies.sample(rand(1..5))
end
