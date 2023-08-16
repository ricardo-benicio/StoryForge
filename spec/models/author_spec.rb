require 'rails_helper'

RSpec.describe Author, type: :model do
  let!(:author) { create(:author) }

  describe 'Present name Author' do
    context 'When name is prensent' do
      it('Author create') { expect(author).to be_valid }
    end
  end
end
