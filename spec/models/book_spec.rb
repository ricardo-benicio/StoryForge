# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'validations' do
    describe 'title' do
      it 'must be present' do
        book = FactoryBot.create(:book)
        expect(book).to_not be_valid
        book.title = 'teste do testando'
        expect(book).to be_valid
      end
    end

    describe 'isbn' do
      it 'must be present' do
        book = FactoryBot.create(:book)
        expect(book).to_not be_valid
        isbn_teste = FFaker::Book.isbn
        book.isbn = isbn_teste
        expect(book).to be_valid
      end
    end
  end
end
