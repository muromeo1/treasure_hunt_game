require 'rails_helper'

RSpec.describe Api::V1::AnalyticsController, type: :request do
  subject(:controller) do
    request, route = self.class.description.split
    send(request, route, params: params, headers: headers)
  end

  let(:user) { create(:user) }
  let(:authentication) { Users::Authenticate.call(email: user.email, password: user.password) }
  let(:parsed_response) { JSON.parse(response.body) }

  let(:params) { {} }
  let(:headers) { { 'Authorization' => authentication.token } }

  before do
    controller
  end

  describe 'get /api/v1/analytics.json' do
    let(:params) do
      {
        'start_time' => [(Time.new - 15.days).strftime('%Y-%m-%d')],
        'end_time' => Time.new.strftime('%Y-%m-%d'),
        'radius' => 1000
      }
    end

    it { expect(response).to have_http_status(200) }
  end
end
