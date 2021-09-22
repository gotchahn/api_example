require 'rails_helper'

RSpec.describe "Api::CountriesController", type: :request do
  describe "GET /api/countries" do
    it "works! (now write some real specs)" do
      get api_countries_path
      expect(response).to have_http_status(200)
    end

    it "gets 404" do
      get api_country_path(1)
      expect(response).to have_http_status(404)
    end

    it "gets 200" do
      country = Country.create(name: "Arandelle", code: "ARA")
      get api_country_path(country.id)
      expect(response).to have_http_status(200)
    end

    it "creates a new country" do
      data = { data: { name: "Zarkovia", code: "ZAR" }}
      post api_countries_path, params: data, headers: {"Content-Type" => "application/json"}, as: :json
      expect(response).to have_http_status(201)
      body = JSON.parse(response.body)
      expect(body["data"]["name"]).to eq("Zarkovia")
    end

    it "500 if the creation fail" do
      data = { data: { name: "Zarkovia" }}
      post api_countries_path, params: data, headers: {"Content-Type" => "application/json"}, as: :json
      expect(response).to have_http_status(422)
    end
  end
end
