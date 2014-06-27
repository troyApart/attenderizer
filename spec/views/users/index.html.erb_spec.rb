require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :phonenumber => "Phonenumber"
      ),
      User.create!(
        :name => "Name",
        :phonenumber => "Phonenumber"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phonenumber".to_s, :count => 2
  end
end
