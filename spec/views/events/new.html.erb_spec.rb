require 'rails_helper'

RSpec.describe "events/new", :type => :view do
  before(:each) do
    assign(:event, Event.new(
      :details => "MyText",
      :time_interval => 1
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "textarea#event_details[name=?]", "event[details]"

      assert_select "input#event_time_interval[name=?]", "event[time_interval]"
    end
  end
end
