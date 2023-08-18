# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    isbn { FFaker::Book.isbn }
    title { FFaker::Book.title }
  end
end
