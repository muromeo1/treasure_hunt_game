require 'rails_helper'

RSpec.describe Destinations::CheckDistance, type: :interactor do
  describe '.call' do
    subject(:interactor) { described_class.call(params) }

    let(:params) { {} }
    let(:email) { Faker::Internet.email }

    context 'when geolocation is missing' do
      let(:params) { { email: email } }

      it { is_expected.to be_a_failure }
    end

    context 'when email is missing' do
      let(:params) { { current_location: [0, 0] } }

      it { is_expected.to be_a_failure }
    end

    context 'when location is outside from 5 meters' do
      let(:params) { { current_location: [-23.539346542243425, -46.49359236963995], email: email } }

      it { expect(interactor.distance).to be >= 5 }
    end

    context 'when location is within a radius of 5 meters' do
      let(:params) { { current_location: [-23.538947306082697, -46.494344094773716], email: email } }

      it { expect(interactor.distance).to be <= 5 }
    end
  end
end
