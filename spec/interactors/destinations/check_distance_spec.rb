require 'rails_helper'

RSpec.describe Destinations::CheckDistance, type: :interactor do
  describe '.call' do
    subject(:interactor) { described_class.call(params) }

    let(:params) { {} }
    let(:user) { create(:user) }

    context 'when geolocation is missing' do
      let(:params) { { email: user.email } }

      it { is_expected.to be_a_failure }
    end

    context 'when email is missing' do
      let(:params) { { current_location: [0, 0] } }

      it { is_expected.to be_a_failure }
    end

    context 'when location is outside from 5 meters' do
      let(:params) do
        {
          current_location: [50.051126753851065, 19.94572434301552],
          email: user.email,
          user: user
        }
      end

      it { expect(interactor.distance).to be >= 5 }
      it { expect(interactor.history).to be_present }
    end

    context 'when location is within a radius of 5 meters' do
      let(:params) do
        {
          current_location: [50.05123396420084, 19.945680757122567],
          email: user.email,
          user: user
        }
      end

      it { expect(interactor.distance).to be <= 5 }
      it { expect(interactor.history).to be_present }
    end
  end
end
