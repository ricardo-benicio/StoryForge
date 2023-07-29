require 'rails_helper'

RSpec.describe "assembly_parts/index", type: :view do
  before(:each) do
    assign(:assembly_parts, [
      AssemblyPart.create!(),
      AssemblyPart.create!()
    ])
  end

  it "renders a list of assembly_parts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
