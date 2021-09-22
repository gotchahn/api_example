require 'rails_helper'

RSpec.describe "Api::InternetUsagesController", type: :request do

  describe "GET /api/internet_usages" do
    it "works! (now write some real specs)" do
      get api_internet_usages_path
      expect(response).to have_http_status(200)
    end

    it "can do filter" do
      region1 = InternetUsage.create(region: "America", year: 2020)
      region2 = InternetUsage.create(region: "Africa", year: 2019)

      get api_internet_usages_path, params: {q: "America"}, headers: { "Content-Type" => "application/json"}, as: :json

      expect(response).to have_http_status(200)
      body = JSON.parse(response.body)
      expect(body["data"].size).to eq(1)
      expect(body["data"][0]["region"]).to eq("America")
    end
  end
end
