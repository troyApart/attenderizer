require 'rails_helper'

RSpec.describe "events/edit", :type => :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :details => "MyText",
      :time_interval => 1
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "textarea#event_details[name=?]", "event[details]"

      assert_select "input#event_time_interval[name=?]", "event[time_interval]"
    end
  end
end
