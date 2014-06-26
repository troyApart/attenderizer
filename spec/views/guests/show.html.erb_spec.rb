require 'rails_helper'

RSpec.describe "guests/show", :type => :view do
  before(:each) do
    @guest = assign(:guest, Guest.create!(
      :name => "Name",
      :phonenumber => "Phonenumber"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phonenumber/)
  end
end
