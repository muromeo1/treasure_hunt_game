require 'rails_helper'

RSpec.describe Sessions::AuthorizeToken, type: :interactor do
  describe '.call' do
    subject(:interactor) { described_class.call(params) }

    let(:params) { {} }
    let(:user) { create(:user) }

    let(:headers) do
      { 'Authorization' => JsonWebToken.encode({ user_id: user.id }) }
    end

    let(:wrong_headers) do
      { 'Authorization' => 's9ao3uih012kjsda09' }
    end

    context 'When token is present' do
      let(:params) { headers }

      it { expect(interactor).to be_a_success }
      it { expect(interactor.user).to eq(user) }
    end

    context 'When token is invalid' do
      let(:params) { wrong_headers }

      it { expect(interactor).to be_a_failure }
      it { expect(interactor.error).to eq('Invalid token') }
    end
  end
end
