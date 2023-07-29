require 'rails_helper'

RSpec.describe "parts/show", type: :view do
  before(:each) do
    assign(:part, Part.create!(
      part_number: "Part Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Part Number/)
  end
end
