require 'rails_helper'

RSpec.describe "Api::Authors", type: :request do
  describe "GET /api/authors" do
    let!(:author) {create_list(:author, 3)}

    it 'returns all authors' do
      get api_authors_path
    end

    it 'returns status code 200' do
      get api_authors_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/authors" do
    context "creating a new author" do
      let(:valid_author_params) do
        {
          author: {
            name: "New Author",
            cpf: "000.000.000-00"
          }
        }
      end

      it 'create author' do
        expect do
          post api_authors_path, params: valid_author_params
        end.to change(Author, :count).by(0)
        #expect(json_response["id"]).to be_present
        expect(json_response[:name]).to eq("New Author")
        expect(json_response["cpf"]).to eq("000.000.000-00")
        expect(response).to have_http_status(:created)

      end
    end
  end
end
