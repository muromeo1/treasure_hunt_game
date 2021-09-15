require 'rails_helper'

RSpec.describe Analytics::GetRequests, type: :interactor do
  describe '.call' do
    subject(:interactor) { described_class.call(params) }

    let(:params) { {} }
    let(:user) { create(:user) }

    let!(:location_history1) { create(:location_history, user_id: user.id, created_at: Time.new - 15.days, radius: 3) }
    let!(:location_history2) { create(:location_history, user_id: user.id, created_at: Time.new - 5.days, radius: 6) }
    let!(:location_history3) { create(:location_history, user_id: user.id, radius: 23) }

    context 'when start_time is present' do
      let(:params) do
        {
          'start_time' => [(Time.new - 8.days).strftime('%Y-%m-%d')]
        }
      end

      it { expect(interactor.requests.size).to eq(2) }
    end

    context 'when end_date is present' do
      let(:params) do
        {
          'end_time' => (Time.new - 14.days).strftime('%Y-%m-%d')
        }
      end

      it { expect(interactor.requests.size).to eq(1) }
    end

    context 'when radius is present' do
      let(:params) do
        {
          'radius' => '6'
        }
      end

      it { expect(interactor.requests.size).to eq(2) }
    end
  end
end
