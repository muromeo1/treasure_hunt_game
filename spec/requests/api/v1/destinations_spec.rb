require 'rails_helper'

RSpec.describe Api::V1::DestinationsController, type: :request do
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

  describe 'post /api/v1/treasure_hunt.json' do
    let(:params) do
      {
        'current_location' => [0, 0],
        'email' => user.email
      }
    end

    it { expect(response).to have_http_status(200) }
  end
end
