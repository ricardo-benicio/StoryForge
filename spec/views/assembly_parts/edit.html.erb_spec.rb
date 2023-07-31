require 'rails_helper'

RSpec.describe "assembly_parts/edit", type: :view do
  let(:assembly_part) {
    AssemblyPart.create!()
  }

  before(:each) do
    assign(:assembly_part, assembly_part)
  end

  it "renders the edit assembly_part form" do
    render

    assert_select "form[action=?][method=?]", assembly_part_path(assembly_part), "post" do
    end
  end
end
