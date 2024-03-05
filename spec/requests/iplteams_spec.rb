require 'rails_helper'

RSpec.describe "Iplteams", type: :request do
  describe "GET /index" do
    it 'returns a successful response' do
      get '/api/v1/iplteams'
      expect(response).to have_http_status(200)
    end

    it 'returns all iplteams as JSON' do
      iplteam1 = FactoryBot.create(:iplteam, name: 'Team 1')
      iplteam2 = FactoryBot.create(:iplteam, name: 'Team 2')

      get '/api/v1/iplteams'
      expect(response.content_type).to eq('application/json; charset=utf-8')

      iplteams_response = JSON.parse(response.body)
      expect(iplteams_response.length).to eq(2)

      expect(iplteams_response[0]['name']).to eq('Team 1')
      expect(iplteams_response[1]['name']).to eq('Team 2')
    end
  end
end
   


