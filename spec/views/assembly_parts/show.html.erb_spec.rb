require 'rails_helper'

RSpec.describe "assembly_parts/show", type: :view do
  before(:each) do
    assign(:assembly_part, AssemblyPart.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
