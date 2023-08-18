require 'isbn'
class Book < ApplicationRecord
  belongs_to :author

  validates :isbn, presence: true, uniqueness: true
  before_validation :isbn_is_valid?

  private
  def isbn_is_valid?
    self.isbn = ISBN.valid?(isbn) if isbn.present?
  end
end
