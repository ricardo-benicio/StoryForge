require 'rails_helper'

RSpec.describe "parts/edit", type: :view do
  let(:part) {
    Part.create!(
      part_number: "MyString"
    )
  }

  before(:each) do
    assign(:part, part)
  end

  it "renders the edit part form" do
    render

    assert_select "form[action=?][method=?]", part_path(part), "post" do

      assert_select "input[name=?]", "part[part_number]"
    end
  end
end
