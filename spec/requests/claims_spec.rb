require "rails_helper"

RSpec.describe "Claims management", type: :request do
  it "creates a Claim" do
    post "/claims", params: { claim: { id: 1 } }
    expect(response).to match_response_schema("claim")
  end
end
