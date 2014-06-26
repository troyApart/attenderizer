require 'rails_helper'

RSpec.describe "Guests", :type => :request do
  describe "GET /guests" do
    it "works! (now write some real specs)" do
      get guests_path
      expect(response.status).to be(200)
    end
  end
end
