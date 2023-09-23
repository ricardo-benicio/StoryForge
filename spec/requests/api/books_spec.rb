# frozen_string_literal: true

require 'rails_helper'
require 'isbn_generator'

RSpec.describe 'Api::Books', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:book, 3)
      get '/api/books'
    end

    it 'returns all books' do
      expect(json_response.size).to eq(3)
    end

    it 'return status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
