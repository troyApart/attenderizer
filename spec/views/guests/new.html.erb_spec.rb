require 'rails_helper'

RSpec.describe "guests/new", :type => :view do
  before(:each) do
    assign(:guest, Guest.new(
      :name => "MyString",
      :phonenumber => "MyString"
    ))
  end

  it "renders new guest form" do
    render

    assert_select "form[action=?][method=?]", guests_path, "post" do

      assert_select "input#guest_name[name=?]", "guest[name]"

      assert_select "input#guest_phonenumber[name=?]", "guest[phonenumber]"
    end
  end
end
