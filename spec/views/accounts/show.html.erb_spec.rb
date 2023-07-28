require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    assign(:account, Account.create!(
      account_number: "Account Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Account Number/)
  end
end
