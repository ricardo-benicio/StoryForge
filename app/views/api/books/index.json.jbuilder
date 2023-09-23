# frozen_string_literal: true

json.array! @book do |book|
  json.id book.id
  json.published_at book.published_at
  json.isbn book.isbn

  json.author do
    json.id book.author.id
    json.name book.author.name
  end
end
