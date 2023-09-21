# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Authors_controller', type: :request do
  describe 'GET /index' do
    it 'Returns a list of authors' do
      authors = FactoryBot.create_list(:author, 5)

      get api_controller_author_index_path

      expect(response).to have_http_status(200)

      parsed_response = JSON.parse(response.body)
      expect(parsed_response.size).to eq(5)
    end
  end
end
