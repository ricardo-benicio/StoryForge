# frozen_string_literal: true

require 'isbn_generator'

FactoryBot.define do
  factory :book do
    isbn { IsbnGenerator.isbn_thirteen }
    published_at { FFaker::Time.date }
    author { create(:author) }
  end
end
