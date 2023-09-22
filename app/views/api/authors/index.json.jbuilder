# frozen_string_literal: true

json.array! @authors do |author|
  json.id author.id
  json.name author.name
  json.cpf author.cpf
end
