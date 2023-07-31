require 'rails_helper'

RSpec.describe "assembly_parts/new", type: :view do
  before(:each) do
    assign(:assembly_part, AssemblyPart.new())
  end

  it "renders new assembly_part form" do
    render

    assert_select "form[action=?][method=?]", assembly_parts_path, "post" do
    end
  end
end
