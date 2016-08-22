require "rails_helper"

RSpec.describe "Claims management", type: :request do
  it "lists all Claim" do
    get "/claims"
    expect(response).to match_response_schema("claims")
  end
end
