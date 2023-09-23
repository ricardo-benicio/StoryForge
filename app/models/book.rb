# frozen_string_literal: true

require 'isbn'
class Book < ApplicationRecord
  belongs_to :author

  validates :isbn, presence: false
  before_validation :isbn_is_valid?

  private

  def isbn_is_valid?
    self.isbn = ISBN.thirteen(isbn) if isbn.present?
  end
end
