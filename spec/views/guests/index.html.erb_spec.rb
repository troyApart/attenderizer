require 'rails_helper'

RSpec.describe "guests/index", :type => :view do
  before(:each) do
    assign(:guests, [
      Guest.create!(
        :name => "Name",
        :phonenumber => "Phonenumber"
      ),
      Guest.create!(
        :name => "Name",
        :phonenumber => "Phonenumber"
      )
    ])
  end

  it "renders a list of guests" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phonenumber".to_s, :count => 2
  end
end
